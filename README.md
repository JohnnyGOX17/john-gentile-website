# john-gentile-website

<a href="https://github.com/JohnnyGOX17/john-gentile-website/actions">
  <img alt="GitHub Workflow Status" src="https://img.shields.io/github/actions/workflow/status/JohnnyGOX17/john-gentile-website/main.yml?branch=master&logo=github&style=flat-square">
</a>
<a href="https://github.com/JohnnyGOX17/john-gentile-website/blob/master/LICENSE">
  <img alt="GitHub" src="https://img.shields.io/github/license/JohnnyGOX17/john-gentile-website?color=orange&logo=github&style=flat-square">
</a>

Repo for website [john-gentile.com](https://john-gentile.com/)

## Searching

A useful strategy to find references, or possible duplicates, is to run `$ ag --markdown <search term>` from the repo toplevel.

## Other Tools

* Launch notebooks with `$ jupyter lab`

### Docker Dev Setup

```
docker build -t jekyll .
docker run -p 4000:4000 -v /Users/jgentile/src/john-gentile-website:/site jekyll
```

## TODO

* [ ] Use [jampack](https://github.com/divriots/jampack) to optimize static site generation, add to pipeline

## References

* [Jekyll Docs](https://jekyllrb.com/docs/)


