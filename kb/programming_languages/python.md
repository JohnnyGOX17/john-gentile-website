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

#### Identifiers and Assignments

An _assignment statement_ looks like:
```python
temperature = 98.6
```
Where the _identifier_ `temperature` is associated with the floating-point _object_, with value of `98.6`. The semantics of Python identifiers is similar to a reference variable in Java or pointer in C/C++; an identifier is associated with the _memory address_ of the object it refers to. Similarly to null references/pointers, a Python identifier can be assigned the special object `None`.

Python is a _dynamically typed_ language; there is no type declaration associating an identifier/variable to a particular data type. An identifier can be associated with any object and can be later reassigned to another object of the same- or different- type. Objects have definite types, so in the above assignment statement, `temperature` is associated with an instance of the `float` class with the value `98.6`.

An _alias_ can be established when a second identifier is assigned to an existing object/identifier. In this case, either name can be used to access the underlying object, and if it supports behaviors that affect its state, changes enacted through one alias will be apparent when using the other alias. However, if one of the names is reassigned to a new value using an assignment statement, this does _not affect_ the aliased object, but rather breaks the alias. For example:

```python
>>> temperature = 98.6
>>> new_temp = temperature
>>> temperature += 5
>>> temperature
103.6
>>> new_temp
98.6
```

### Built-In Classes


| **Class** | **Description** | **Immutable?** |
| ----- | ----------- | ---------- |
| `bool` | Boolean value, `True` and `False`. Numbers evaluate to `False` if zero (`True` if non-zero), and container types (strings, lists, etc.) evaluate to `False` if empty, `True` otherwise. | ✓ |
| `int` | Integer numeric type with arbitrary internal size (e.g. not 32-bit limited, Python chooses internal representation based on magnitude). Literals for binary, octal, decimal and hexadecimal representations are `0b1011`, `0o56`, `-23`, `0x5f` respectively. Converting a floating-point value to `int` truncates similar to other languages (e.g. `int(3.14)` gives `3`). Conversion to `int` from an invalid type (e.g. string) returns a `ValueError` | ✓ |
| `float` | Floating-point type, similar to `double` precision type in Java/C++. Literals can be expressed as `2.0`, `3.`, or `5.123e22` (for value of $$ 5.123 \times 10^{22} $$). Python can convert floating-point strings to `float` with constructors like `float('3.14')` | ✓ |
| `list` | Stores a sequence of objects, similar to an "array" in other languages using `[]` delimiters. A list stores a sequence of _references_ to its elements. Lists are mutable and can dynamically expand and contract their capacities. A list containing three strings can be shown as `['red', 'green', 'blue']` | |
| `tuple` | An immutable sequence class using `()` delimiters. Note a one-element tuple should be expressed as `(12,)` to not be confused with general parenthesis usage. | ✓ |
| `str` | Python string class to efficiently represent an immutable sequence of Unicode characters. Sting literals can use single or double quotes (e.g. `'hello'` or `"hello"`) | ✓ |
| `set` | A collection of elements without duplicates and without order, similar to the mathematical notion of a set, delimited with curly braces `{}`. Compared to a list, the major advantage is the internal representation of a _hash table_ which efficiently can check if a specific element is contained in the `set`. A `set` does maintain elements in any order, and only immutable types can be added to a set. | |
| `frozenset` | Immutable form of the `set` type, thus its legal to have a `set` of `frozensets` | ✓ |
| `dict` | A _dictionary_ class or _mapping_, from a set of distinct _keys_ to associated _values_. Python implements a `dict` similar to a `set` but with storage of associated values. Key:Value pairs are expressed with comma-separated pairs like `{'ga' : 'Irish', 'de' : 'German'}` to map `'ga'` to `'Irish'` and `'de'` to `'German'`. | |


### Exception Handling

Exceptions are unexpected events that happen during program execution. Exceptions (or errors) are objects _raised_ (or _thrown_) by code that encounters an unexpected circumstance. A raised error may be _caught_ by a surrounding context that "handles" the exception. If uncaught, an exception causes the interpreter to stop program execution.

| **Class** | **Description** |
| ------- | ------------- |
| `Exception` | A base class for most error types |
| `AttributeError` | Raised by syntax obj.foo, if obj has no member named foo |
| `EOFError` | Raised if “end of file” reached for console or file input |
| `IOError` | Raised upon failure of I/O operation (e.g., opening file) |
| `IndexError` | Raised if index to sequence is out of bounds |
| `KeyError` | Raised if nonexistent key requested for set or dictionary |
| `KeyboardInterrupt` | Raised if user types ctrl-C while program is executing |
| `NameError` | Raised if nonexistent identifier used |
| `StopIteration` | Raised by next(iterator) if no element; see Section 1.8 |
| `TypeError` | Raised when wrong type of parameter is sent to a function |
| `ValueError` | Raised when parameter has invalid value (e.g., sqrt(−5)) |
| `ZeroDivisionError` | Raised when any division operator used with 0 as divisor |

An exception is thrown with a `raise` statement. For instance, the `sqrt` (square root) function in Python's math library performs the following error-checking before executing the square root math:

```python
def sqrt(x):
    if not instance(x, (int, float)):
        raise TypeError('x must be numeric')
    elif x < 0:
        raise ValueError('x cannot be negative')
    # start doing sqrt() math now...
```

To catch an exception, there is the `try-except` control structure. For instance to handle a potential- however not highly likely path that would otherwise be handled with a more direct control structure- divide-by-zero error:

```python
try:
    ratio = x / y
except ZeroDivisionError:
    # handle issue
```


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


### Other Testing Tools

* [tox](https://tox.wiki/en/latest/) automates standardized testing across Python platforms and environments.


## Packaging

* [Python Packaging User Guide](https://packaging.python.org/en/latest/)

### Virtual Environments `venv`

Python virtual environments- named [venv](https://docs.python.org/3/library/venv.html)- are used to isolate packages and tool versions. It's suggested when working with a Python library that uses third party packages to [use pip in a venv](https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/). Generally, the steps to create and activate a `venv` are:
1. Create the environment (need only do once, usually at the root of a project repo): `$ python3 -m venv .venv`.
2. Activate the `venv`: `$ source .venv/bin/activate`.
3. Do Python things, like `pip` install required packages: `$ python3 -m pip install -r requirements.txt`.
4. When done, deactivate the `venv` with simply: `$ deactivate`.


### Packaging and Uploading Python Projects

See the [tutorial on Packaging Python Projects](https://packaging.python.org/en/latest/tutorials/packaging-projects/) and register an account on [PyPI](https://pypi.org/) to publicly share your project. After setting up the repo structure and `pyproject.toml`, you can:
* Build the distribution archive using:
  + `$ python3 -m pip install --upgrade build`
  + `$ python3 -m build`
* Install locally and automatically track any edits to the underlying repo with:
  + `$ python3 -m pip install --editable .` (from within the repo top-level).
* Uninstall package with `$ python3 -m pip uninstall <package name> -y`

If your `pyproject.toml` properly includes the package dependencies, calling `pip install` will also install the correct dependencies as well. You can also [install optional dependencies by specifying the list expicitly](https://stackoverflow.com/a/69977707/5416738), like `pip install .[docs]` (note no space between `.` and `[key]` for optional install).

### Documenting Your Project

A great way to document your Python project, as well as docstrings, in Markdown is using [MkDocs](https://www.mkdocs.org/). [This is an example on setting up a repo](https://realpython.com/python-project-documentation-with-mkdocs/) for MkDocs.

Other documentation frameworks which use reStructuredText (`*.rst`) format are:
* [Read the Docs](https://docs.readthedocs.io/en/stable/index.html)
* [Sphinx](https://www.sphinx-doc.org/en/master/index.html)

## Other Useful Tools

* [psf/black](https://github.com/psf/black): uncompromising Python code formatter.
* [pyright](https://github.com/microsoft/pyright): static type checker and linter for Python
* [mypy](https://github.com/python/mypy): Static Type checker
  + See also [Advanced Static Typing with mypy (part1)](https://dev.to/chadrik/the-missing-guide-to-python-static-typing-532i)
* [flake8](https://github.com/PyCQA/flake8): a python tool that glues together pycodestyle, pyflakes, mccabe, and third-party plugins to check the style and quality of some python code.
* [pylint](https://github.com/PyCQA/pylint): static code analyzer and linter.
* [ruff](https://github.com/charliermarsh/ruff): extremely fast Python linter written in Rust

### Basic Python Web Server

If you have some static web resources (e.g. HTML pages, etc.), you can quickly spin-up a web server in that directory to display them using Python(3):

`$ python -m http.server <port_number>`


## Libraries and Distributions

### SciPy

[SciPy](https://scipy.org/index.html) is the de facto Python library for computing, math, science and engineering. The ecosystem encompasses other large, popular, open-source libraries such as:
* **[NumPy](https://numpy.org/):** multi-dimensional array processing package. Provides a fast and efficient multidimensional array object `ndarray`. Has many linear algebra and signal processing algorithms built-in, as well as a mature C APU to enable Python extensions and C/C++ to access NumPy's data structures.
* **[Matplotlib](https://matplotlib.org/):** a plotting & graphing library.
  - [seaborn](https://seaborn.pydata.org/) is a data visualization library, and high-level interface, based on `matplotlib`.
* **[IPython](https://ipython.org/):** an interactive console approach to Python development, which also coincides with the [Jupyter](https://jupyter.org/) Project, which provides interactive computing notebooks.
  - Jupyter is a very powerful resource for data analysis, engineering, math and other disciplines. A wide variety of tools and plugins exist to make Jupyter notebooks similar to a full IDE (or similar to other full-fledged processing and graphing tools like MATLAB), and tools like [nbconvert](https://nbconvert.readthedocs.io/en/latest/) can be used to export Jupyter notebooks to other formats, such as LaTeX and PDF.
* **[SymPy](http://sympy.org/):** performs symbolic math manipulations and computations. It can solve algebraic and differential equations, simplify expresions, apply trigonometric identities, differentiate, integrate, etc.
  - [SageMath](https://www.sagemath.org/) is a mathematics software system which integrates SymPy and other SciPy libraries in a complete system.
* **[pandas](http://pandas.pydata.org/):** a library for data structures & analysis. `pandas` blends the array processing ideas of `NumPy` with the common data manipulation ideas found in spreadsheets and relational databases (e.g. SQL).

It's recommended to install SciPy, and all of the associated packages, with `pip` since some distros still point to Python 2 repos. Or you could install [Anaconda](https://www.anaconda.com/products/individual) which can be installed on Mac, Windows or Linux and easily installs Python and all required libraries.

#### Jupyter Notebook Tips

#####  Running Jupyter Notebook/Lab Remotely

Sometimes it's advantageous to have Jupyter run on a remote machine that you can SSH into from a local machine. This can be accomplished- with only forwarding over SSH port- by:
1. SSH into the remote box with port forwarding with `$ ssh -L localhost:8889:localhost:8889 <remote IP address or hostname>`
  + Add `-Nf` too `ssh` command if wanting to launch in another terminal window and immediately return.
2. In SSH session, launch Jupyter lab headlessly on a specific port, like `$ jupyter lab --no-browser --port=8889`
3. Open a browser window to `http://localhost:8889/lab?token=<token URL string from Jupyter launch in SSH session>` (or just click the link it outputs in the terminal)
  + Besides running notebooks remotely, this method allows opening & viewing of other remote files.


#####  Jupyter Lab Plugins

- [Jupyter Lab](https://jupyterlab.readthedocs.io/en/stable/index.html) is the next-generation web-based UI for Jupyter notebooks.
  + Vim keybindings are currently best supported with the plugin [jupyterlab-contrib/jupyterlab-vim](https://github.com/jupyterlab-contrib/jupyterlab-vim).
    * [Keybindings can also be modified](https://github.com/jupyterlab-contrib/jupyterlab-vim/blob/master/modify-keybinds.md) similar to a `.vimrc` settings file
  + Spell checking of Markdown cells can be achieved with the [jupyterlab-spellchecker](https://github.com/jupyterlab-contrib/spellchecker) plugin
- Since plaintext diffs of Jupyter notebooks are sometimes not very insightful, tools like [nbdime](https://nbdime.readthedocs.io/en/latest/) are useful to better diff & merge notebooks within a Git repo.
  + [ReviewNB](https://www.reviewnb.com/) is a service that can similarly help with reviews on public repos like GitHub
  + You can also use a [git filter](https://github.com/JohnnyGOX17/configs/blob/master/configs/.gitconfig#L51) to remove Jupyter notebook cell output, and other unnecessary metadata (see https://stackoverflow.com/a/58004619 and https://stackoverflow.com/a/73218382). This allows git operations (e.g. when diff'ing or committing changes) to operate on the cleaned notebook (e.g. just code and Markdown cell changes) while allowing the local file copy to retain any current output cell state.
- Use `%matplotlib widget` to [render animated matplotlib plots](https://stackoverflow.com/a/56416229)


#####  Exporting Jupyter Notebooks

Jupyter notebooks can be exported to many formats, like HTML, LaTeX and PDF. However, if you run into weird font errors in `nbconvert`, note that it [may be due to leading and/or trailing spaces in inline math text](https://stackoverflow.com/a/72291257); for instance `$ \epsilon  \gt 0 $` within a text block may cause an error and should be changed to `$\epsilon  \gt 0$`.


### Data Analysis

* **[scikit-learn](https://scikit-learn.org/):** general-purpose machine learning toolkit for Python.
* **[statsmodels](https://www.statsmodels.org/stable/index.html):** statistical analysis package which contains algorithms for classical statistics and econometrics.
* **[TensorFlow](https://www.tensorflow.org/):** machine learning framework.
* **[PyTorch](https://pytorch.org/):** machine learning framework.


## References

* [Official Documentation for Python 3](https://docs.python.org/3/)
  - [The Python Tutorial](https://docs.python.org/3/tutorial/index.html)
* [Think Python, 3rd Ed - Allen Downey](https://greenteapress.com/wp/think-python-3rd-edition/)
  - [Other Free eBooks from Allen Downey & Green Tea Press](https://greenteapress.com/wp/)
* [Automate the Boring Stuff with Python](https://automatetheboringstuff.com/)
* [vinta/awesome-python: A curated list of awesome Python frameworks, libraries, software and resources](https://github.com/vinta/awesome-python)
* [TheAlgorithms/Python: All Algorithms implemented in Python](https://github.com/TheAlgorithms/Python)
* [markusschanta/awesome-jupyter: A curated list of awesome Jupyter projects, libraries and resources](https://github.com/markusschanta/awesome-jupyter)
* [NumPy for MATLAB users — NumPy v1.20 Manual](https://numpy.org/doc/stable/user/numpy-for-matlab-users.html)
* [PythonSpeed/PerformanceTips - Python Wiki](https://wiki.python.org/moin/PythonSpeed/PerformanceTips)

### To Read

* [ ] [Transforming Code into Beautiful, Idiomatic Python - Pycon US 2013 YouTube](https://www.youtube.com/watch?v=OSGv2VnC0go)
* [Python for Data Analysis, 3rd Edition](https://www.amazon.com/Python-Data-Analysis-Wrangling-Jupyter-dp-109810403X/dp/109810403X?&linkCode=sl1&tag=quantpytho-20&linkId=2d1788b1f52212848d18095cf9972e07&language=en_US&ref_=as_li_ss_tl)
  - [ ] [Open-access site from author](https://wesmckinney.com/book/)
  - [GitHub repo for Python for Data Analysis](https://github.com/wesm/pydata-book)
* [ ] [Full-Speed Python](https://github.com/joaoventura/full-speed-python)
* [ ] [Learning Python, 5th Edition by Mark Lutz](https://www.amazon.com/Learning-Python-5th-Mark-Lutz/dp/1449355730) (on Page 67) 
* [ ] [Programming Python, 4th Edition by Mark Lutz](http://shop.oreilly.com/product/9780596158118.do) 
* [ ] [Python 3 Patterns, Recipes and Idioms](https://python-3-patterns-idioms-test.readthedocs.io/en/latest/)
* [ ] [Design Patterns in Python - Refactoring.guru](https://refactoring.guru/design-patterns/python)
* [ ] [Python Design Patterns](https://python-patterns.guide/)

