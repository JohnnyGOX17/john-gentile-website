---
title: Python
layout: default
kb: true
top-category: Programming Languages
comments: true
---

## Language

Python is one of the most popular interpreted programming languages. An _interpreted language_ is not directly compiled to a target machine code (e.x. x86 assembly), but rather a different program- the interpreter- reads and executes the code. This leads to use of Python- and other interpreted languages- as _scripting languages_, since they can be used to quickly cobble together commands in scripted fashion. However, unlike pure scripting languages (e.x. [Shell scripting](./shell.html)), Python has had some serious improvements to speed and scalability, which makes it perfectly viable for "production code"; one of the canonical examples is where [YouTube was able to outpace Google Video in implementing features due to simply having only Python codebase](https://books.google.com/books?id=eulODwAAQBAJ&lpg=PA136&dq=google%20video%20vs%20youtube%20python%20story&pg=PA136#v=onepage&q=google%20video%20vs%20youtube%20python%20story&f=false). Sometimes the speed up in development is more valuable than the speedup in execution time.

Python is mainly split between the 2.X (older, now somewhat 'de facto' standard due to no more planned changes) and 3.X (the newer, forced Unicode generation of Python) and it's important to note where compatibility breaks between the two.

Pros of the language:
* _Quality:_ Python has been designed to be readable and very maintainable with a smaller size / less amount of code for similar functions in other programming languages like C++ or Java.
* _Portability:_ For the most part, Python can be run on all supported platforms (Windows, Mac & Linux) with little to no code modification.
* _Libraries & Components:_ Python is so widespread that there is a huge amount of libraries supporting a vast array of functionality that is easy to implement. Easy compnent integration also allows Python to be flexible enough in calling other code libraries or frameworks.

Cons:
* Really the main one is execution speed of Python's intermediate "byte code" versus a fully compiled language like C.

### The Basics

Python uses whitespace (tabs or spaces) to structure code, unlike other programming languages which uses braces (like C/C++). A colon (`:`) marks the start of an indented, logical code block- after which, indentation returns to its previous level. For instance, this `for` loop with with a conditional check:
```python 
# this is a comment
for i in my_list:
    if i < max_value:
        print("Not max")
    else:
        max_value = i
```


### Objects & Datatypes

Everything is an object in Python. 




### Conventions

#### Common Import Naming

The Python community has adopted some common naming conventions for popular modules:
```python
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import statsmodels as sm
```


## Performance

Since Python is an interpreted language, compiled languages like [C/C++](./c_cpp.html), [Rust](./rust.html), Java, etc. will generally run faster in execution. In applications where the execution time of only a small portion of the code is critical, Python can be used as "glue code" to implement the majority of the functionality, while calling the performance-critical code using [bindings or Foreign Function Interface (FFI)](https://realpython.com/python-bindings-overview/). Nearly as fast, the series of improvements in just-in-time (JIT) compilers and libraries have become a way to get high performance while staying within Python. A popular JIT compiler is [Numba](https://numba.pydata.org/) which can generate vectorized, multithreaded code from Python.


### Multithreading & the GIL

In general, Python can be challenging to build highly concurrent applications due to the [Global Interpreter Lock (GIL)](https://realpython.com/python-gil/) which prevents the interpreter from executing more than one Python instruction at a time.


## Testing

### pytest

[`pytest`](https://docs.pytest.org/en/latest/) is a testing framework with easy usage; you need only write test functions that match `def test_*` and use the standard `assert` Python operator. For example, a simple Python file `test_sample.py` can contain the following:
```python
# content of test_sample.py
def inc(x):
    return x + 1

def test_answer():
    assert inc(3) == 5
```

And the expected unit test failure can be found with `pytest` as:
```sh
$ pytest
=========================== test session starts ============================
platform linux -- Python 3.x.y, pytest-7.x.y, pluggy-1.x.y
rootdir: /home/sweet/project
collected 1 item

test_sample.py F                                                     [100%]

================================= FAILURES =================================
_______________________________ test_answer ________________________________

    def test_answer():
>       assert inc(3) == 5
E       assert 4 == 5
E        +  where 4 = inc(3)

test_sample.py:6: AssertionError
========================= short test summary info ==========================
FAILED test_sample.py::test_answer - assert 4 == 5
============================ 1 failed in 0.12s =============================
```

### Other 

* [`psf/black`](https://github.com/psf/black) uncompromising Python code formatter.
* [`mypy`](https://github.com/python/mypy) Static Type checker


## Libraries and Distributions

### SciPy

[SciPy](https://scipy.org/index.html) is the de facto Python library for computing, math, science and engineering. The ecosystem encompasses other large, popular, open-source libraries such as:
* **[NumPy](https://numpy.org/):** multi-dimensional array processing package. Provides a fast and efficient multidimensional array object `ndarray`. Has many linear algebra and signal processing algorithms built-in, as well as a mature C APU to enable Python extensions and C/C++ to access NumPy's data structures.
* **[Matplotlib](https://matplotlib.org/):** a plotting & graphing library.
  - [seaborn](https://seaborn.pydata.org/) is a data visualization library, and high-level interface, based on `matplotlib`.
* **[IPython](https://ipython.org/):** an interactive console approach to Python development, which also coincides with the [Jupyter](https://jupyter.org/) Project, which provides interactive computing notebooks.
  - Jupyter is a very powerful resource for data analysis, engineering, math and other disciplines. A wide variety of tools and plugins exist to make Jupyter notebooks similar to a full IDE (or similar to other full-fledged processing and graphing tools like MATLAB), and tools like [nbconvert](https://nbconvert.readthedocs.io/en/latest/) can be used to export Jupyter notebooks to other formats, such as LaTeX and PDF.
  - [Jupyter Lab](https://jupyterlab.readthedocs.io/en/stable/index.html) is the next-generation web-based UI for Jupyter notebooks.
    + Vim keybindings are currently best supported with plugins like [axelfahy/jupyterlab-vim](https://github.com/axelfahy/jupyterlab-vim) & [ianhi/jupyterlab-vimrc](https://github.com/ianhi/jupyterlab-vimrc), but also seems to [soon be in the mainline](https://github.com/jupyterlab/jupyterlab/pull/9068).
    + Spell checking of Markdown cells can be achieved with the [jupyterlab-spellchecker](https://github.com/jupyterlab-contrib/spellchecker) plugin
* **[SymPy](http://sympy.org/):** performs symbolic math manipulations and computations. It can solve algebraic and differential equations, simplify expresions, apply trigonometric identities, differentiate, integrate, etc.
  - [SageMath](https://www.sagemath.org/) is a mathematics software system which integrates SymPy and other SciPy libraries in a complete system.
* **[pandas](http://pandas.pydata.org/):** a library for data structures & analysis. `pandas` blends the array processing ideas of `NumPy` with the common data manipulation ideas found in spreadsheets and relational databases (e.g. SQL).

It's recommended to install SciPy, and all of the associated packages, with `pip` since some distros still point to Python 2 repos. Or you could install [Anaconda](https://www.anaconda.com/products/individual) which can be installed on Mac, Windows or Linux and easily installs Python and all required libraries.

### Data Analysis

* **[scikit-learn](https://scikit-learn.org/):** general-purpose machine learning toolkit for Python.
* **[statsmodels](https://www.statsmodels.org/stable/index.html):** statistical analysis package which contains algorithms for classical statistics and econometrics.
* **[TensorFlow](https://www.tensorflow.org/):** machine learning framework.
* **[PyTorch](https://pytorch.org/):** machine learning framework.


## References

* [Official Documentation for Python 3](https://docs.python.org/3/)
  - [The Python Tutorial](https://docs.python.org/3/tutorial/index.html)

### To Read

* [ ] [Transforming Code into Beautiful, Idiomatic Python - Pycon US 2013 YouTube](https://www.youtube.com/watch?v=OSGv2VnC0go)
* [Python for Data Analysis, 3rd Edition](https://www.amazon.com/Python-Data-Analysis-Wrangling-Jupyter-dp-109810403X/dp/109810403X?&linkCode=sl1&tag=quantpytho-20&linkId=2d1788b1f52212848d18095cf9972e07&language=en_US&ref_=as_li_ss_tl)
  - [ ] [Pre-release site from author](https://wesmckinney.com/book/)
  - [GitHub repo for Python for Data Analysis](https://github.com/wesm/pydata-book)
* [ ] [Learning Python, 5th Edition by Mark Lutz](https://www.amazon.com/Learning-Python-5th-Mark-Lutz/dp/1449355730) (on Page 67)
* [ ] [Programming Python, 4th Edition by Mark Lutz](http://shop.oreilly.com/product/9780596158118.do)

