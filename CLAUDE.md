# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Jekyll-based personal website and knowledge base (john-gentile.com) focused on engineering topics including DSP, radar, machine learning, programming languages, and software engineering. Content is authored in both Markdown and Jupyter notebooks, with notebooks automatically converted to Jekyll-compatible Markdown during the build process.

## Development Environment Setup

**Prerequisites:**
- Python 3.11+ with virtualenv
- Ruby 3.1+ with bundler and jekyll
- Git filter configured for Jupyter notebooks

**Initial Setup:**
```bash
# Create and activate Python virtual environment (required on macOS)
python3 -m venv .venv
source .venv/bin/activate

# Install all dependencies
make install
```

## Common Commands

**Local Development:**
```bash
make serve              # Build site, serve locally with live reload at localhost:8888
make jupyter            # Start Jupyter Lab server at localhost:8889
make test               # Build and serve static site for manual verification
```

**Building:**
```bash
make build              # Full production build (includes notebook conversion)
make clean              # Remove all generated files and notebook outputs
make clean_hashes       # Delete notebook MD5 hash files only
```

**Updating Dependencies:**
```bash
make update             # Update all Ruby gems
```

## Architecture & Content Structure

### Content Organization

The site has two main content types:

1. **Knowledge Base (`kb/` directory)** - Organized by technical domains:
   - `analog/` - Analog Electronics
   - `digital/` - Digital Electronics
   - `dsp/` - Digital Signal Processing
   - `machine_learning/` - Machine Learning
   - `math/` - Mathematics
   - `programming_languages/` - Programming Languages
   - `radar/` - Radar Systems
   - `security/` - Cyber and Security
   - `software-engineering/` - Software Engineering
   - `lifestyle/` - Lifestyle topics

2. **Blog Posts (`_posts/` directory)** - Date-prefixed articles

### Jupyter Notebook Workflow

**Critical:** Jupyter notebooks (`.ipynb`) use a git filter to strip outputs/metadata before commits:
- Filter configured in `.gitattributes`: `*.ipynb filter=strip-notebook-output`
- Git filter command strips outputs using `jupyter nbconvert` with clear preprocessors
- After adding/modifying notebooks, run: `git add --renormalize .`

**Notebook to Markdown Conversion (`notebook_to_markdown.py`):**
- Automatically runs during `make serve` and `make build`
- Uses MD5 hashing to detect changed notebooks and only converts those
- Hash files stored as `.{notebook_name}.ipynb.md5` in same directory
- Conversion process:
  1. Execute notebook to generate fresh outputs (`nbconvert --execute`)
  2. Convert to Markdown
  3. Post-process Markdown to add:
     - Jekyll YAML frontmatter with metadata
     - Google Colab badge (for KB articles only)
     - Proper math formatting (converts `$` to `$$` for inline math)
     - HTML-wrapped output blocks with monospace styling
     - Category metadata from directory path
- Blog posts vs KB articles handled differently (see `blog_post` flag in script)

### Jekyll Configuration

- Main config: `_config.yml`
- Production config overlay: `_config-publish.yml` (merged during builds)
- Uses kramdown for Markdown processing with KaTeX for math rendering
- Key plugins: jekyll-scholar (citations), jekyll-sitemap, jekyll-feed

### Layouts

- `_layouts/default.html` - Main site layout (16KB, handles both blog and KB)
- `_layouts/amp.html` - AMP (Accelerated Mobile Pages) version
- `_layouts/bib.html` - Bibliography template for jekyll-scholar

## Deployment

The site is automatically deployed on pushes to `master`:
1. GitHub Actions workflow (`.github/workflows/main.yml`) triggers
2. Python/Ruby dependencies installed and cached
3. Notebooks converted to Markdown
4. Jekyll builds static site to `_site/`
5. Jampack minifies and compresses resources
6. Git revision written to `_site/revision` for tracking
7. Specific blog post asset directories copied manually
8. Site synced to S3 bucket (`s3://john-gentile.com`)

## Content Authoring Guidelines

**For Knowledge Base Articles:**
- Use Jupyter notebooks (`.ipynb`) in appropriate `kb/` subdirectory
- First H1 header becomes page title (extracted to YAML frontmatter)
- Include only ONE H1 header
- Math: Use single `$` for inline, `$$` for block (script auto-converts)
- Set category by placing in correct subdirectory (mapped in `notebook_to_markdown.py`)

**For Blog Posts:**
- Use Jupyter notebooks in `_posts/` with date prefix: `YYYY-MM-DD-Title.ipynb`
- Follow same H1/math conventions as KB articles
- Blog posts get `blog_post: true` in frontmatter (no Colab badge)

**Searching Content:**
Use `ag --markdown <search term>` from repo root to find references or duplicates.

## Port Configuration

Environment variables can override default ports:
- `SERVE_PORT` - Jekyll serve port (default: 8888)
- `JUPYTER_PORT` - Jupyter Lab port (default: 8889)

## Important Notes

- Always work within Python virtualenv on macOS (enforced by Makefile)
- Notebook outputs are never committed (stripped by git filter)
- Notebook conversion is incremental (MD5-based change detection)
- Manual asset copying required for blog posts with generated files (see workflow)
