---
title: Large Languagle Models (LLMs) & Natural Language Processing (NLP)
layout: default
kb: true
top-category: Machine Learning
comments: true
wip: true
---

## Overview

## Large Language Models (LLM)

### Popular Cloud LLMs

* [ChatGPT - OpenAI](https://chatgpt.com/)
* [Claude - Anthropic](https://claude.ai/)
* [Gemini - Google](https://gemini.google.com/), which also has other tools like [AI Studio](https://aistudio.google.com/prompts/new_chat) which also has a very large context window.
* [Grok - xAI](https://grok.com/)

#### LLMs for Coding

* LLMs have varied abilities when it comes to coding.
  + (3/27/2025) so far [Claude 3.7 Sonnet](https://www.reddit.com/r/ClaudeAI/comments/1izhsrx/i_tested_claude_37_sonnet_against_grok3_and/) has slightly better coding results.
* Various vendor and open-source tools exist like:
  + [Claude Code](https://github.com/anthropics/claude-code)
  + [yamadashy/repomix](https://github.com/yamadashy/repomix): packs an entire repository into a single, AI-friendly file, which can then be uploaded to most LLMs.

#### LLMs for Research and Knowledge

* [Claude](https://www.anthropic.com/news/web-search), [OpenAI/ChatGPT](https://openai.com/index/introducing-deep-research/) and [Grok](https://grok.com) have "research" modes where the model is open to searching the internet, and has multi-step reasoning to come up with deep assessments and recommendations.
  + As of 7/12/2025, Grok 4 seems to be the SOTA model for knowledge and research.
* [Google's NotebookLM](https://notebooklm.google.com/) is targeted at helping research in Jupyter-style notebooks.


#### LLMs for Image Generation

* [ChatGPT's Sora](https://sora.chatgpt.com/) is great for realistic and photo image generation.
* Most general models can synthesize an image from a prompt if the result is a text-based image format such as SVG, [Mermaid](https://mermaid.js.org/), HTML/CSS, etc.

### Prompt Engineering

Suggestions:
- Start with a short and simple prompt, and iterate to get better results.
- Put instructions at beginning or end of prompt, while clearly separating instructions from the text of interest.
- Describe how the model should behave and respond- for example, if looking for coding advice, can create a system prompt of `You are a helpful assistant that answers programming questions.`
  + Add specificity and descriptions about the task and desired output, as well as including examples of output if possible.
  + Instructions should tell what "to do" rather than "what not to do".


References:
* [Prompt Engineering Guide](https://www.promptingguide.ai/)
* [Prompt engineering - Hugging Face](https://huggingface.co/docs/transformers/en/tasks/prompting)
* [Prompt engineering - OpenAI](https://platform.openai.com/docs/guides/prompt-engineering)
* [OpenAI Cookbbok](https://cookbook.openai.com/)
* [Anthropic's Prompt Engineering Interactive Tutorial](https://github.com/anthropics/prompt-eng-interactive-tutorial)


### Self-Hosted

* [Ollama](https://ollama.com/): easily run LLMs locally. Very easy to setup and start.
  + [llama.cpp](https://github.com/ggml-org/llama.cpp): fast, low overhead inference of LLMs in C/C++ that runs under-the-hood of Ollama.
* [Hugging Face](https://huggingface.co/): pre-trained NLP models & reference
* [LangChain](https://python.langchain.com/docs/introduction/): LangChain is a Python framework for developing applications powered by large language models (LLMs).

#### Other Uses/Automation

* [LaurieWired/GhidraMCP](https://github.com/LaurieWired/GhidraMCP): ghidraMCP is an Model Context Protocol server for allowing LLMs to autonomously reverse engineer applications. It exposes numerous tools from core Ghidra functionality to MCP clients.

### Architecture & References

* [Attention Is All You Need- Arxiv](https://arxiv.org/pdf/1706.03762.pdf): introduces concepts of transformers and attention
* [LLaMA: Open and Efficient Foundation Language Models - arXiv](https://arxiv.org/abs/2302.13971): Meta AI open-source LLM model.
* [llama3 implemented from scratch](https://github.com/naklecha/llama3-from-scratch)
* [Transformer Inference Arithmetic](https://kipp.ly/transformer-inference-arithmetic/)
* [Transformer Math 101](https://blog.eleuther.ai/transformer-math/) with a focus on training cost.
* [Training data-efficient image transformers & distillation through attention- Facebook AI](https://arxiv.org/pdf/2012.12877.pdf)
* [The Illustrated Transform](http://jalammar.github.io/illustrated-transformer/): NLP walk-through
* [Tiny LLM - LLM Serving in a Week](https://skyzh.github.io/tiny-llm/)
* [DeepSeek v3 & R1 Model Architecture](https://fireworks.ai/blog/deepseek-model-architecture)
* [How to Scale Your Model- A Systems View of LLMs on TPUs - Jax-ML](https://jax-ml.github.io/scaling-book/)

