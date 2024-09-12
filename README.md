# john-gentile-website

<a href="https://github.com/JohnnyGOX17/john-gentile-website/actions">
  <img alt="GitHub Workflow Status" src="https://img.shields.io/github/actions/workflow/status/JohnnyGOX17/john-gentile-website/main.yml?branch=master&logo=github&style=flat-square">
</a>
<a href="https://github.com/JohnnyGOX17/john-gentile-website/blob/master/LICENSE">
  <img alt="GitHub" src="https://img.shields.io/github/license/JohnnyGOX17/john-gentile-website?color=orange&logo=github&style=flat-square">
</a>

Repo for website [john-gentile.com](https://john-gentile.com/).

## Building

* Read and execute the `install` step in the [Makefile](./Makefile).
* Uses [filter](https://github.com/JohnnyGOX17/configs/blob/master/configs/.gitconfig#L51) to remove Jupyter notebook unnecessary output/metadata before committing (from https://stackoverflow.com/a/58004619 & https://stackoverflow.com/a/73218382). This allows git operations (e.x. diff'ing, commits) to operate on the cleaned notebook (e.g. just code and Markdown cell changes) while allowing the local file copy to retain any current output cell state.
  + Uses '*.ipynb filter=strip-notebook-output' in [.gitattributes file](./.gitattributes).
  + Run `git add --renormalize .` to go through all of your existing notebook files and scrub the outputs.

## Searching

A useful strategy to find references, or possible duplicates, is to run `$ ag --markdown <search term>` from the repo toplevel.


### Docker Dev Setup

```
docker build -t jekyll .
docker run -p 4000:4000 -v /Users/jgentile/src/john-gentile-website:/site jekyll
```

## References

* [Jekyll Docs](https://jekyllrb.com/docs/)


