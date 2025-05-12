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

### LLMs for Coding

* (3/27/2025) so far [Claude 3.7 Sonnet](https://www.reddit.com/r/ClaudeAI/comments/1izhsrx/i_tested_claude_37_sonnet_against_grok3_and/) has slightly better coding results.

### LLMs for Research

[Claude](https://www.anthropic.com/news/web-search), [OpenAI/ChatGPT](https://openai.com/index/introducing-deep-research/) and [Grok](https://grok.com) have "research" modes where the model is open to searching the internet, and has multi-step reasoning to come up with deep assessments and recommendations.

### Self-Hosted

* [LLaMA: Open and Efficient Foundation Language Models - arXiv](https://arxiv.org/abs/2302.13971): Meta AI open-source LLM model.
  + [llama3 implemented from scratch](https://github.com/naklecha/llama3-from-scratch)
  + [llama.cpp](https://github.com/ggerganov/llama.cpp): fast, low overhead inference of LLaMA in C/C++.

### Other Uses/Automation

* [LaurieWired/GhidraMCP](https://github.com/LaurieWired/GhidraMCP): ghidraMCP is an Model Context Protocol server for allowing LLMs to autonomously reverse engineer applications. It exposes numerous tools from core Ghidra functionality to MCP clients.

## References

* [Attention Is All You Need- Arxiv](https://arxiv.org/pdf/1706.03762.pdf): introduces concepts of transformers and attention
* [Hugging Face](https://huggingface.co/): pre-trained NLP models & reference
* [Training data-efficient image transformers & distillation through attention- Facebook AI](https://arxiv.org/pdf/2012.12877.pdf)
* [The Illustrated Transform](http://jalammar.github.io/illustrated-transformer/): NLP walk-through
* [Tiny LLM - LLM Serving in a Week](https://skyzh.github.io/tiny-llm/)

