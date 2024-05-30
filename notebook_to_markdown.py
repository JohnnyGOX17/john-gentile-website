#!/usr/bin/env python3

import os
import subprocess


STYLE_HEADER="<p style=\"font-family:monospace; white-space:pre-wrap\">\n"
STYLE_TRAILER="</p>\n"
#GOOGLE_COLAB_URL="[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JohnnyGOX17/john-gentile-website/blob/master/kb/math_and_signal_processing/notebooks/tf_basics.ipynb)"
GOOGLE_COLAB_URL="[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JohnnyGOX17/john-gentile-website/blob/master/"

def match_subdir_to_category(subdir: str) -> str:
    match subdir:
        case "./kb/machine_learning":
            return "Machine Learning"
        case _:
            return "UNKNOWN CATEGORY"


def convert_jupyter_to_markdown(file_path: str):
    print(subprocess.run(["jupyter", "nbconvert", "--to", "markdown", file_path]))

def convert_jupyter_md_output(jupyter_path: str, file_path: str, category: str):
    in_code_block = False
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
    output_lines.append(GOOGLE_COLAB_URL + jupyter_path + ")\n\n")

    with open(file_path, "r") as f:
        for line in f:
            if line.startswith("```"): # code block toggle
                in_code_block = not in_code_block
                output_lines.append(line)
            elif not in_code_block:
                if not in_output_block:
                    if line.startswith("    ") and not line.isspace() and not in_math_block:
                        # start output block
                        output_lines.append(STYLE_HEADER)
                        output_lines.append(line[4:])
                        in_output_block = True
                    else: # not start of output block
                        if line.startswith("# "): #Remove header and put in YAML title field
                            if not header_found:
                                output_lines[1] = "title: " + line[2:].replace(':', '-')
                                header_found = True
                            else:
                                print("WARN: an H1 Markdown header was already found, removing! Offending line: ")
                                print(line)
                        elif "$" in line: # at least some kind of mathy thing here
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

                        else: # nothing else to do, just output line
                            output_lines.append(line)
                else: # in output block
                    if line.startswith("    "): # still in output block
                        output_lines.append(line[4:])
                    else: # finish out output block
                        output_lines.append(STYLE_TRAILER)
                        output_lines.append(line)
                        in_output_block = False
            else: # in code block, just output
                output_lines.append(line)

    assert header_found, "An H1 Markdown header was not found!"

    with open(file_path, "w") as f:
        f.writelines(output_lines)


if __name__ == "__main__":
    for subdir, dirs, files in os.walk("./kb/"):
        for file in files:
            if file.endswith(".ipynb") and ".ipynb_checkpoints" not in subdir:
                top_category = match_subdir_to_category(subdir)
                jupyter_file = os.path.join(subdir, file)
                markdown_file = os.path.join(subdir, file[:-6] + ".md")

                convert_jupyter_to_markdown(jupyter_file)
                convert_jupyter_md_output(jupyter_file, markdown_file, top_category)
