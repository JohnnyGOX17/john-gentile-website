---
title: Machine Learning
layout: default
kb: true
top-category: Machine Learning
comments: true
wip: true
---

## Overview

It is useful to review [linear algebra concepts](linear_algebra.html) before continuing.

TBD reference {% cite Goodfellow --file machine_learning %}

### Intro ML


## Software and Platforms

### TensorFlow

[TensorFlow](https://www.tensorflow.org/) is one of the most popular platforms for Machine Learning development, protoyping and deployment.

#### TensorFlow Docker Container with GPU Support

Follow instructions at [python-lib/tensorflow](https://github.com/JohnnyGOX17/python-lib/tree/master/tensorflow) to install a Docker container with NVIDIA CUDA GPU support and common Jupyter & SciPy libraries.

#### TensorFlow Development

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JohnnyGOX17/john-gentile-website/blob/master/kb/math_and_signal_processing/notebooks/tf_basics.ipynb)

#### Other TensorFlow Resources

- **[instillai/TensorFlow-Course](https://github.com/instillai/TensorFlow-Course):** some simple tutorials and Jupyter notebooks on getting started with TensorFlow.
- **[TensorFlow Hub](https://tfhub.dev/):** repository of hundreds of trained, ready-to-deploy machine learning models.




### PyTorch



### Jupyter Notebooks

For more info, see [SciPy distribution in Python](/kb/programming_languages/python.html#scipy) about installing Jupyter notebook support.

Another great tool which comes with most all dependencies/libraries ready to go is [Google Colab](https://colab.research.google.com/), which allows you to store (in Google Drive), edit and run (even on GPU & TPU servers in some instances) Jupyter notebooks in the Google cloud environment.

### Other Tools

* **[Horovod](https://github.com/horovod/horovod):** Horovod is a distributed deep learning training framework for TensorFlow, Keras, PyTorch, and Apache MXNet
* **[MLPerf](https://mlcommons.org/en/):** ML benchmark results for various computing platforms.
* [Caffe 2](https://caffe2.ai/) is now a part of [PyTorch](#pytorch)

## References
{% bibliography --cited_in_order --file machine_learning %}

* [Dive into Deep Learning — Dive into Deep Learning 0.15.1 documentation](http://d2l.ai/)
* [MIT Deep Learning 6.S191](http://introtodeeplearning.com/)
* [Deep Learning](https://www.deeplearningbook.org/)
* [Practical Deep Learning for Coders | Practical Deep Learning for Coders](https://course.fast.ai/)
* [Neural networks and deep learning](http://neuralnetworksanddeeplearning.com/)
* [GitHub - josephmisiti/awesome-machine-learning: A curated list of awesome Machine Learning frameworks, libraries and software.](https://github.com/josephmisiti/awesome-machine-learning)
* [NVIDIA Deep Learning Examples](https://github.com/NVIDIA/DeepLearningExamples)
* [GPT in 60 Lines of NumPy](https://jaykmody.com/blog/gpt-from-scratch/)
