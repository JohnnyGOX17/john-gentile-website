---
title: Python Language
layout: default
kb: true
top-category: Programming Languages
comments: true
---

## Language

Python is mainly split between the 2.X (older, now somewhat 'de facto' standard due to no more planned changes) and 3.X (the newer, forced Unicode generation of Python) and it's important to note where compatibility breaks between the two.

Pros of the language:
* _Quality:_ Python has been designed to be readable and very maintainable with a smaller size / less amount of code for similar functions in other programming languages like C++ or Java.
* _Portability:_ For the most part, Python can be run on all supported platforms (Windows, Mac & Linux) with little to no code modification.
* _Libraries & Components:_ Python is so widespread that there is a huge amount of libraries supporting a vast array of functionality that is easy to implement. Easy compnent integration also allows Python to be flexible enough in calling other code libraries or frameworks.

Cons:
* Really the main one is execution speed of Python's intermediate "byte code" versus a fully compiled language like C.

{% highlight python %}
{% endhighlight %}

--- Learning Python, Pg 67 ---

Example of integration of Jupyter notebook in Jekyll:

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JohnnyGOX17/john-gentile-website/blob/master/kb/programming_languages/notebooks/example.ipynb)

{::nomarkdown}
{% jupyter_notebook "/kb/programming_languages/notebooks/example.ipynb" %}
{:/nomarkdown}


## Libraries and Distributions

### SciPy

[SciPy](https://scipy.org/index.html) is the de facto Python library for computing, math, science and engineering. The ecosystem encompasses other large, popular, open-source libraries such as:
* **[NumPy](http://numpy.org/):** multi-dimensional array processing package.
* **[Matplotlib](http://matplotlib.org/):** a plotting & graphing library.
* **[IPython](http://ipython.org/):** an interactive console approach to Python development, which also coincides with the [Jupyter](https://jupyter.org/) Project, which provides interactive computing notebooks.
  - Jupyter is a very powerful resource for data analysis, engineering, math and other disciplines. A wide variety of tools and plugins exist to make Jupyter notebooks similar to a full IDE (or similar to other full-fledged processing and graphing tools like MATLAB), and tools like [nbconvert](https://nbconvert.readthedocs.io/en/latest/) can be used to export Jupyter notebooks to other formats, such as LaTeX and PDF.
  - [Jupyter Lab](https://jupyterlab.readthedocs.io/en/stable/index.html) is the next-generation web-based UI for Jupyter notebooks.
    + Vim keybindings are currently best supported with plugins like [axelfahy/jupyterlab-vim](https://github.com/axelfahy/jupyterlab-vim) & [ianhi/jupyterlab-vimrc](https://github.com/ianhi/jupyterlab-vimrc), but also seems to [soon be in the mainline](https://github.com/jupyterlab/jupyterlab/pull/9068).
* **[SymPy](http://sympy.org/):** for symbolic math.
* **[pandas](http://pandas.pydata.org/):** a library for data structures & analysis.

It's recommended to install SciPy, and all of the associated packages, with `pip` since some distros still point to Python 2 repos. Or you could install [Anaconda](https://www.anaconda.com/products/individual) which can be installed on Mac, Windows or Linux and easily installs Python and all required libraries.


## References

* [Learning Python, 5th Edition by Mark Lutz](https://www.amazon.com/Learning-Python-5th-Mark-Lutz/dp/1449355730)
* [Programming Python, 4th Edition by Mark Lutz](http://shop.oreilly.com/product/9780596158118.do)
