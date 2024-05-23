---
title: Machine Learning Blog/Website Design
author: John Gentile
layout: default
kb: false
blog_post: true
comments: true
---

Building a technical blog or website of any kind poses many unique challenges, but there's nearly infinite ways to design a site; you can choose from many different content management frameworks and site generator tools. For me, I decided to use [Jekyll](https://jekyllrb.com/) static website generator because of the many FOSS extensions and development flexibility, as well as the low-cost (often free, like [GitHub Pages](https://pages.github.com/)) hosting ability of static websites. With this base framework, I found a couple great add-ons and tools that help to make a great blog for technical notes, especially when working with Machine Learning notebooks.

[Jupyter Notebooks](https://jupyter.org/) are currently a very popular way for taking notes on research to prototyping Python code on a variety of frameworks. Jupyter Notebooks are great because the text and equations can be easily entered as Markdown, and the Python code blocks are interactive and executable. The challenge this presents is when you have valuable notes and/or code that you want to maintain as part of a Jupyter Notebook, but still want to have the ability to post the notebook as part of your website (or any HTML medium really).

I've tried more intensive methods such as [embedding notebooks using binder](https://elc.github.io/posts/embed-interactive-notebooks/) or [embedding Google Colab notebooks in Medium posts](https://medium.com/@lzhou1110/how-to-embed-google-colaboratory-into-medium-in-3-steps-487b525b103c), however the most flexible tool is `nbconvert` that shops with Jupyter packages. It can convert notebooks into HTML, Markdown, PDF and a variety of other formats.


For documentation and website purposes, the non-interactive, static presentation should be fine; any necessary support for actual code edits or dynamic response should simply be handled with a link to the Notebook in a full environment with execution support, such as [Google Colab](https://colab.research.google.com/). What's also great about Google Colab is that [you can directly run and edit notebooks on GitHub](https://colab.research.google.com/github/googlecolab/colabtools/blob/master/notebooks/colab-github-demo.ipynb#scrollTo=8QAWNjizy_3O), and create an easy "Open in Colab" badge like:
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JohnnyGOX17/john-gentile-website/blob/master/kb/math_and_signal_processing/notebooks/tf_basics.ipynb)

Another great plugin for technical research blogging is [inukshuk/jekyll-scholar](https://github.com/inukshuk/jekyll-scholar); this plugin inserts and formats bibliographies for Jekyll posts and makes citing sources very easy, similar to the process used in LaTeX documents. You can set the citation style to a variety of publication standards, as well as reference standard `*.bib` and `*.bibtex` bibliography files.

From there, depending on the exact format used, the insertion of a bibliography can be done with a Liquid tag:

{% raw %}
```markdown
{% bibliography %}
```
{% endraw %}

Then, citations can be made in text, similar to LaTeX `\cite{author}` style, using another inline Liquid tag:

{% raw %}
```markdown
{% cite author %}
```
{% endraw %}

These, and even more FOSS plugins, make for an easy pipeline for deploying technical research to static webpages, especially when dealing with Jupyter Notebooks for topics like Machine Learning.

