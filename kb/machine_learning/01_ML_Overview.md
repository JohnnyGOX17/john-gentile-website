---
title: Machine Learning Overview
layout: default
kb: true
top-category: Machine Learning
comments: true
wip: false
---

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JohnnyGOX17/john-gentile-website/blob/master/./kb/machine_learning/01_ML_Overview.ipynb)


> A computer program is said to learn from experience E with respect to some task T and some performance measure P, if its performance on T, as measured by P, improves with experience E.- Tom Mitchell (1997)

Machine Learning (ML) is all about making digital logic get better at some specific task or problem area by learning from data, rather than the traditional process of explicitly coding up rules or deriving closed form algorithms to find a solution. There are many different types of ML systems and learning models, but gathering good data is key overall.

These ML notes are based on the book [Hands-on Machine Learning with Scikit-Learn, Keras and TensorFlow](https://www.oreilly.com/library/view/hands-on-machine-learning/9781492032632/). Supporting notebooks on datasets and example code used can also be founded in the author's GitHub repo [ageron/handson-ml2](https://github.com/ageron/handson-ml2).

## When to Use Machine Learning

todo...

## Taxonomy of Machine Learning Systems

ML systems can be broadly categorized by:
- If they are trained with human supervision/intervention (e.g. [supervised](#supervised_learning), [unsupervised](#unsupervised_learning), [semisupervised](#semisupervised_learning), and [Reinforcement Learning](#reinforcement_learning))
- If they can learn incrementally (e.g. [online](#online_learning) versus [batch learning](#batch_learning))
- If they can work by comparing new data points to known ones, or rather by interpreting patterns in training data to build predictive a model (e.g. [instance-based](#instance_learning) vs [model-based learning](#model_learning))

### Supervised Learning
<a id='supervised_learning'></a>

Here the training dataset you feed the ML model includes the desired solutions/outcomes which are called _labels_. Some typical applications of Supervised Learning are:
- **Classification:** many image classification tasks fit this model, such as a passing a training data set of different looks of images, each labeled by a specific _class_ (like "cat", "dog", "giraffe", etc.)
- **Regression:** for example a model can be given a set of _features/attributes_ like mileage, age, brand, etc. (called _predictors_) to predict a _target_ car price. The label would still be the attributed price given a certain configuration of predictors.
- **Logistic Regression:** outputs a value, but can be used for classification, for instance outputting a probability of an input sample belonging to a given class.

### Unsupervised Learning
<a id='unsupervised_learning'></a>

Here the training dataset fed to the ML model is unlabeled, so the system must learn without an explicit "teacher". Some examples of unsupervised learning applications are:
- **Clustering:** here the model will try and "cluster" or group data sets for you. If using a _hierarchical clustering_ algorithm, it also may subdivide each group into smaller groups.
- **Visualization:** these algorithms are great for visualizing a 2D, or 3D, representation of your unlabeled dataset while maintaining clustering structure.
- **Dimensionality Reduction:** here the goal is to simplify an input dataset without losing too much information by learning to merge correlated features into one, called _feature extraction_. Note that using this dimension reduction on very complex input training data is a great idea before feeding that dataset into another ML algorithm; the feature extraction can help to reduce the dataset size (e.g. to run faster) and may even improve performance of the ML algorithm.
- **Anomaly Detection:** for applications like fraud detection (or anything where we want to detect "unusualness" in a dataset), we show mostly "normal" instances during training so when a "new instance" is seen, it can tell whether it looks like a normal one or an anomaly.
- **Association Rule Learning:** here the goal is for the algorithm to discover new/interesting relations between attributes in a dataset.

### Semisupervised Learning
<a id='semisupervised_learning'></a>

Labeling data can be a costly activity so some _semisupervised learning_ algorithms can deal with partially labeled datasets. Many are a combination of supervised and unsupervised learning algorithms. For instance for Google Photos, you can upload a bunch of pictures and the unsupervised part of the system will cluster faces/people, and then when you label a person (technically the supervised part), it is able to use that label across any other photos it has clustered already; this is common for searching for people across unlabeled photos.

### Reinforcement Learning
<a id='reinforcement_learning'></a>

_Reinforcement Learning_ (RL) is very different compared to the (un)supervised learning methods; in this system, the learning model- called an _agent_- can observe the given environment, perform actions, and then get _rewards_ (positive reinforcement) or _penalties_ (negative reinforcement) in return. Based on the reinforcement, the system must then learn the best strategy to optimize positive rewards over time, called a _policy_; a policy is an action the agent should choose in a given situation.

RL is used often in how robots learn to walk, or famously how DeepMind's AlphaGo program learned to play the complicated game of Go:


```python
from IPython.display import IFrame
IFrame('https://www.youtube.com/embed/WXuK6gekU1Y', width=560, height=315)
```





<iframe
<p style="font-family:monospace; white-space:pre-wrap">
width="560"
height="315"
src="https://www.youtube.com/embed/WXuK6gekU1Y"
frameborder="0"
allowfullscreen
</p>
></iframe>




### Batch Learning
<a id='batch_learning'></a>

A system that requires _batch learning_ cannot learn incrementally, it must be trained with all available data. Since this is compute/time intensive, the system is first trained "offline" (that is, not in a fielded/production use), and then once trained, it is deployed online where it runs without learning anymore. This is also known as _offline learning_. The implications of a batch learning system is that if any new data/features need to be learned, a new model with new data needs to be trained.

### Online Learning
<a id='online_learning'></a>

Conversely to a batch learning system, an _online learning_ system can learn "online"; as in, after initial training and deployed, the system can continuously learn as new data comes in. This is useful for systems data need to adapt quickly to a continuous flow of data, such as a stock price predictor model.

Since the model can continuously learn, once data has gone through the system, it can be discarded (which saves lots of memory space). As well, this means online learning can be used with massive datasets that don't all fit in a computing instance at one time, which is called _out-of-core_ learning.

The _learning rate_ is an important parameter for online systems; a faster learning rate will rapidly adapt to new data but conversely forget old data faster and be more sensitive to noise or outliers in the data set; this is very similar to loop bandwidth in Control Theory.

Since new data is constantly changing the system's response and actions, one needs to be careful with a deployed online system that bad data can adversely affect the performance; monitoring the input dataset to react to abnormal data could be done by also using an anomaly detection algorithm.

### Instance-Based Learning
<a id='instance_learning'></a>

In _instance-based learning_, the model is trained on a discrete set of data/features that the system "learns by heart", and then _generalizes_ (e.g. makes preditions) to new cases by using a _measure of similarity_ between it and the learned data. This is the most basic form of learning.

### Model-Based Learning
<a id='model_learning'></a>

A _model-based learning_ system generalizes from a set of given input examples, but builds a "model" of these examples to later make _predictions_. Similarly to how one would try and create a line-of-best-fit in a linear regression data problem, a model-based learning system can use a set of _model parameters_ to optimize/best-fit to non-linear problems. The measure of performance/fit can be defined with either a _utility/fitness function_ (e.g. a function which tells the system how good the model is doing) or a _cost function_ (the logical inverse which measures how bad it's doing); for instance in the traditional linear regression problem, a cost function could be defined as the distance between data points and the model's predictive line, where the model wants to minimize the distance between all points.

The act of feeding training examples to a model and varying parameters to find a best fit (e.g. minimum cost) is called _training_. When a model is well trained, it well make good predictions. If it doesn't make good predictions, one might need to use more attributes, get more/better quality input data, and/or select a different regression model. Applying a model to make predictions on new data is called _inference_.

## Machine Learning Challenges

- **Not Enough Training Data:**  ML algorithms generally require a lot of data to learn, even for simple problems. It can be shown that accuracy goes up with more input data across algorithms, and that sometimes with enough input data, the accuracy/performance across algorithms converges. For instance, there are many [examples](https://static.googleusercontent.com/media/research.google.com/en//pubs/archive/35179.pdf) and [research papers](https://dl.acm.org/doi/10.3115/1073012.1073017) that show that **data matters more than algorithms** for complex problems. It's thus often a trade-off on spending more time/cost on culminating more valuable dataets rather than focusing on algorithm developments.
- **Nonrepresentative Training Data:** both instance-based and model-based learning requires that training data is representative of data you expect to see/generalize-to in deployment. If the sample dataset is too small the model will have _sampling noise_ (nonrepresentative results based on guess/chance), but even very large datasets can be bad if they do not accurately/fully represent the expected dataset (e.g. through a flawed sampling method) which causes _sampling bias_ as the model is fit to technically a subset of features that are really in the wild.
  + **Bad Quality Data:** as a further extension of the importance of representative data, if your dataset is full of errors, outliers and noise (say due to just bad measurements), the system performance will be hindered. It's another reason why spending the time to clean and groom your dataset is worth it; for instance, just discard instances of clear outliers or fix errors manually.
  + **Irrelevant Features:** you want to include enough relevant features to properly train a system, but not include too many irrelevant features that could screw up the process. This process called _feature engineering_ involves:
<p style="font-family:monospace; white-space:pre-wrap">
* _Feature Selection:_ selecting the most useful features to train among all features
* _Feature Extraction:_ combining existing features to produce a more useful one (for instance, the previously discussed dimensionality reduction algorithms). 
* Create new features by gathering more representative data.
</p>
- **Overfitting:** over-generalizing conclusions is something we humans do a lot, but in an ML system this is due to _overfitting_; essentially when a model is too complex relative to the amount of noisiness of the training data, or not enough data was given, a deep neural net can jump to the wrong conclusions and draw associations for predictions that aren't correct. To solve overfitting, one could:
  + Simplify the model by selecting fewer parameters/attributes in the training data. This constraining action is called _regularization_. The amount of regularization can be controlled by a _hyperparameter_ which can help tune the relationship between overfitting vs adaptability to new data.
<p style="font-family:monospace; white-space:pre-wrap">
* Simplifying a data _too_ much can actually lead to _underfitting_, where the model's predictaions are then inaccurate, even on the training samples.
</p>
  + Gather more training data
  + Reduce the noise in the training data by fixing data errors and removing outliers

## ML System Testing & Validation

One way to test the performance of your ML system is to split your data into two sets: a _training set_ and a _test set_; the error rate on new cases is called the _generalization error_. If the training error is low (model makes few mistakes on the training set) but the generalization error is high (many mistakes on test/new data set), the model is clearly overfitted to the training data.

## Data Sources

There is a plethora of datasets one could use for ML:
* [UC Irvine ML Repo](http://archive.ics.uci.edu/ml/)
* [Kaggle Datasets](https://www.kaggle.com/datasets)
* [AWS Registry of Open Datasets](https://registry.opendata.aws/)
* [Data Portals list of Open Data](http://dataportals.org/)
* [Open Data Monitor](https://opendatamonitor.eu/frontend/web/index.php?r=dashboard%2Findex)
* [Quandl Financial & Market Data](https://www.quandl.com/)
* [Wikipedia list of datasets for ML research](https://en.wikipedia.org/wiki/List_of_datasets_for_machine-learning_research)
