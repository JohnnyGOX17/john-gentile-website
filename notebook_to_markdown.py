#!/usr/bin/env python3

import hashlib
import os
import subprocess


def md5_file_hash(file_path: str) -> str:
    """Compute MD5 hash of given file"""
    md5 = hashlib.md5()

    with open(file_path, "rb") as f:
        while True:
            # Read & hash 64kB chunks at a time
            data = f.read(65536)
            if not data:
                break
            md5.update(data)

    return md5.hexdigest()


def notebook_changed(subdir: str, file: str) -> bool:
    """Hashes given Jupyter notebook file and compares to previous hash value on-disk.
    If the hash is different- or previous hash is nonexistent- the hash file is
    updated and returns True. Otherwise, file contents haven't changed, returns False"""

    hash_file = os.path.join(subdir, "." + file + ".md5")
    jupyter_file = os.path.join(subdir, file)

    try:
        with open(hash_file, "r") as f:
            prev_hash = f.readline()
            curr_hash = md5_file_hash(jupyter_file)
            if prev_hash == curr_hash:
                return False
    except IOError:
        print(f"{hash_file} not found, creating...")

    with open(hash_file, "w") as f:
        f.write(md5_file_hash(jupyter_file))

    return True


def match_subdir_to_category(subdir: str) -> str:
    match subdir:
        case "./kb/analog":
            return "Analog Electronics"
        case "./kb/business":
            return "Business"
        case "./kb/digital":
            return "Digital Electronics"
        case "./kb/dsp":
            return "Digital Signal Processing (DSP)"
        case "./kb/lifestyle":
            return "Lifestyle"
        case "./kb/machine_learning":
            return "Machine Learning"
        case "./kb/math_and_signal_processing":
            return "Math & Signal Processing"
        case "./kb/programming_languages":
            return "Programming Languages"
        case "./kb/radar":
            return "Radar"
        case "./kb/wireless_comms":
            return "Wireless Communication Systems"
        case "./kb/security":
            return "Cyber and Security"
        case "./kb/software-engineering":
            return "Software Engineering"
        case _:
            return "UNKNOWN CATEGORY"


def convert_jupyter_to_markdown(file_path: str):
    """Use nbconvert to run the notebook (get cell outputs, as notebooks will be
    cleared on CI builds) export notebook to raw Markdown, from: https://stackoverflow.com/a/35572827"""
    print(
        subprocess.run(
            ["jupyter", "nbconvert", "--execute", "--to", "markdown", file_path]
        )
    )


def convert_jupyter_md_output(jupyter_path: str, file_path: str, category: str):
    """Take raw nbconvert Markdown and stylize correctly"""
    in_code_block = False
    in_iframe_block = False
    in_output_block = False
    in_math_block = False
    header_found = False
    output_lines = []

    # Add YAML header for Jekyll metadata and site generation
    output_lines.append("---\n")
    output_lines.append("title: TBD\n")
    output_lines.append("layout: default\n")
    output_lines.append("kb: true\n")
    output_lines.append("top-category: " + category + "\n")
    output_lines.append("comments: true\n")
    output_lines.append("wip: false\n")
    output_lines.append("---\n\n")

    # Add Google colab badge to also run notebook source interactively
    google_colab_url = "[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JohnnyGOX17/john-gentile-website/blob/master/"
    output_lines.append(google_colab_url + jupyter_path + ")\n\n")

    with open(file_path, "r") as f:
        for line in f:
            if line.startswith("```"):  # code block toggle
                in_code_block = not in_code_block
                output_lines.append(line)
            elif line.startswith("<iframe"):  # iframe start
                in_iframe_block = True
                output_lines.append(line)
            elif not in_code_block and not in_iframe_block:
                if not in_output_block:
                    if (
                        line.startswith("    ")
                        and not line.isspace()
                        and not in_math_block
                    ):
                        # start output block with HTML header
                        output_lines.append(
                            '<p style="font-family:monospace; white-space:pre-wrap">\n'
                        )
                        lbracket_rep = line.replace("<", "&lt;")
                        rbracket_rep = lbracket_rep.replace(">", "&gt;")
                        output_lines.append(rbracket_rep[4:])
                        in_output_block = True
                    else:  # not start of output block
                        if line.startswith(
                            "# "
                        ):  # Remove header and put in YAML title field
                            if not header_found:
                                output_lines[1] = "title: " + line[2:].replace(":", "-")
                                header_found = True
                            else:
                                print(
                                    "WARN: an H1 Markdown header was already found, removing! Offending line: "
                                )
                                print(line)
                        elif "$" in line:  # at least some kind of mathy thing here
                            num_double_sign = line.count("$$")
                            if num_double_sign == 0 and not in_math_block:
                                # no block/multi-line math, simply add extra dollar sign
                                replaced_line = line.replace("$", "$$")
                                # this is to fix places where the $ is intended (e.g. currency text)
                                replaced_line = replaced_line.replace("\\$$", "$")
                                output_lines.append(replaced_line)
                            else:
                                output_lines.append(line.replace("$$", "\n$$\n"))
                                if num_double_sign % 2 == 1:
                                    # odd number of double signs, toggle in math block
                                    in_math_block = not in_math_block

                        else:  # nothing else to do, just output line
                            output_lines.append(line)
                else:  # in output block
                    if line.startswith("    "):  # still in output block
                        lbracket_rep = line.replace("<", "&lt;")
                        rbracket_rep = lbracket_rep.replace(">", "&gt;")
                        output_lines.append(rbracket_rep[4:])
                    else:  # finish out output block
                        # HTML trailer block
                        output_lines.append("</p>\n")
                        output_lines.append(line)
                        in_output_block = False
            else:  # in code or iframe block, just output
                output_lines.append(line)
                if line.startswith("></iframe>"):
                    in_iframe_block = False

    assert header_found, "An H1 Markdown header was not found!"

    with open(file_path, "w") as f:
        f.writelines(output_lines)


if __name__ == "__main__":
    for subdir, dirs, files in os.walk("./kb/"):
        for file in files:
            if file.endswith(".ipynb") and ".ipynb_checkpoints" not in subdir:
                if notebook_changed(subdir, file):
                    top_category = match_subdir_to_category(subdir)
                    jupyter_file = os.path.join(subdir, file)
                    markdown_file = os.path.join(subdir, file[:-6] + ".md")

                    convert_jupyter_to_markdown(jupyter_file)
                    convert_jupyter_md_output(jupyter_file, markdown_file, top_category)
