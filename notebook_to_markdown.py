#!/usr/bin/env python3

import os
import subprocess


STYLE_HEADER="<p style=\"font-family:monospace; white-space:pre-wrap\">\n"
STYLE_TRAILER="</p>\n"

def match_subdir_to_category(subdir: str) -> str:
    match subdir:
        case "./kb/machine_learning":
            return "Machine Learning"
        case _:
            return "UNKNOWN CATEGORY"


def convert_jupyter_to_markdown(file_path: str):
    print(subprocess.run(["jupyter", "nbconvert", "--to", "markdown", file_path]))

def convert_jupyter_md_output(file_path: str, category: str):
    in_code_block = False
    in_output_block = False
    header_found = False
    output_lines = []

    output_lines.append("---\n")
    output_lines.append("title: TBD\n")
    output_lines.append("layout: default\n")
    output_lines.append("kb: true\n")
    output_lines.append("top-category: " + category + "\n")
    output_lines.append("comments: true\n")
    output_lines.append("wip: false\n")
    output_lines.append("---\n\n")

    with open(file_path, "r") as f:
        for line in f:
            if line.startswith("```"):
                in_code_block = not in_code_block
                output_lines.append(line)
            elif not in_code_block:
                if not in_output_block:
                    if line.startswith("    ") and not line.isspace():
                        output_lines.append(STYLE_HEADER)
                        output_lines.append(line[4:])
                        in_output_block = True
                    else:
                        # Remove header and put in YAML title field
                        if line.startswith("# "):
                            if not header_found:
                                output_lines[1] = "title: " + line[2:].replace(':', '-')
                                header_found = True
                            else:
                                print("WARN: an H1 Markdown header was already found, removing! Offending line: ")
                                print(line)
                        else:
                            output_lines.append(line)
                else:
                    if line.startswith("    "):
                        output_lines.append(line[4:])
                    else:
                        output_lines.append(STYLE_TRAILER)
                        output_lines.append(line)
                        in_output_block = False
            else:
                # in code block, just output
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
                convert_jupyter_md_output(markdown_file, top_category)
