---
title: Machine Learning
layout: default
kb: true
top-category: Math & Signal Processing
comments: true
wip: true
---

## Overview

It is useful to review [linear algebra concepts](linear_algebra.html) before continuing.

blah blah blah {% cite Goodfellow --file machine_learning %}

### Intro ML

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JohnnyGOX17/john-gentile-website/blob/master/kb/math_and_signal_processing/notebooks/MNIST_intro.ipynb)

{::nomarkdown}
{% jupyter_notebook "/kb/math_and_signal_processing/notebooks/MNIST_intro.ipynb" %}
{:/nomarkdown}

## Software and Platforms

### TensorFlow

[TensorFlow](https://www.tensorflow.org/) is one of the most popular platforms for Machine Learning development, protoyping and deployment.

#### TensorFlow Docker Container with GPU Support

Follow instructions at [python-lib/tensorflow](https://github.com/JohnnyGOX17/python-lib/tree/master/tensorflow) to install a Docker container with NVIDIA CUDA GPU support and common Jupyter & SciPy libraries.

#### TensorFlow Development

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JohnnyGOX17/john-gentile-website/blob/master/kb/math_and_signal_processing/notebooks/tf_basics.ipynb)

{::nomarkdown}
{% jupyter_notebook "/kb/math_and_signal_processing/notebooks/tf_basics.ipynb" %}
{:/nomarkdown}

### Caffe

[Caffe 2](https://caffe2.ai/)

### Jupyter Notebooks

For more info, see [SciPy distribution in Python](/kb/programming_languages/python.html#scipy) about installing Jupyter notebook support.

Another great tool which comes with most all dependencies/libraries ready to go is [Google Colab](https://colab.research.google.com/), which allows you to store (in Google Drive), edit and run (even on GPU & TPU servers in some instances) Jupyter notebooks in the Google cloud environment.

### Other Tools

* **[Horovod](https://github.com/horovod/horovod):** Horovod is a distributed deep learning training framework for TensorFlow, Keras, PyTorch, and Apache MXNet
* **[MLPerf](https://mlcommons.org/en/):** ML benchmark results for various computing platforms.

## References
{% bibliography --cited_in_order --file machine_learning %}
