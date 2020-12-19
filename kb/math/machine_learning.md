---
title: Machine Learning
layout: default
kb: true
top-category: Math
comments: true
wip: true
---

## Overview

It is useful to review [linear algebra concepts](linear_algebra.html) before continuing.

blah blah blah {% cite Goodfellow --file machine_learning %}

## Software and Platforms

### TensorFlow

[TensorFlow](https://www.tensorflow.org/) is one of the most popular platforms for Machine Learning development, protoyping and deployment.

#### TensorFlow Docker Container with GPU Support

Follow instructions at [python-lib/tensorflow](https://github.com/JohnnyGOX17/python-lib/tree/master/tensorflow) to install a Docker container with NVIDIA CUDA GPU support and common Jupyter & SciPy libraries.

#### TensorFlow Development

{::nomarkdown}
{% jupyter_notebook "/kb/math/notebooks/tf_basics.ipynb" %}
{:/nomarkdown}

### Caffe

[Caffe 2](https://caffe2.ai/)

### Other Tools

* **[Horovod](https://github.com/horovod/horovod):** Horovod is a distributed deep learning training framework for TensorFlow, Keras, PyTorch, and Apache MXNet
* **[MLPerf](https://mlcommons.org/en/):** ML benchmark results for various computing platforms.

## References
{% bibliography --cited_in_order --file machine_learning %}
