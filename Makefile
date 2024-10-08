# Makefile for john-gentile.com

# Tell Linux vs macOS
UNAME_S := $(shell uname -s)
SITE_DIR := ./_site/

# Ports to use for local servers (user/env overrideable)
SERVE_PORT ?= 8888
JUPYTER_PORT ?= 8889

PY_EXE ?= python3

.SILENT: clean serve test

check-env:
ifndef VIRTUAL_ENV
ifeq ($(UNAME_S),Darwin)
	# On macOS, need to be in venv like `python3 -m venv .venv && source .venv/bin/activate`
	$(error Not in a Python virtualenv!)
endif
endif

build:
	# Clean stale data
	rm -rf $(SITE_DIR)
	./notebook_to_markdown.py
	# Generate intermediate files from Jekyll (use additional publish configs)
	bundle exec jekyll build --config _config.yml,_config-publish.yml
	# Write current git revision to file for tracking
	git rev-parse HEAD > $(SITE_DIR)/revision

clean_hashes:
	find . -type f -name '*.ipynb.md5' -delete

clean_notebook_outputs: clean_hashes
	git clean -fX

clean: clean_notebook_outputs
	# Deleting generated files...
	rm -rf $(SITE_DIR)
	rm -f TODO.md
	rm -f .sass-cache
	rm -f .jekyll-metadata

jupyter: check-env
	jupyter lab --no-browser --port=$(JUPYTER_PORT)

install_python: check-env
ifeq ($(UNAME_S),Darwin)
	$(PY_EXE) -m pip install --upgrade -r requirements.txt
endif
ifeq ($(UNAME_S),Linux)
	$(PY_EXE) -m pip install --upgrade --user -r requirements.txt
endif

install: install_python
	# Run before building on new system to install dependent packages or to
	# update local packages
	# NOTE: for Linux, don't install gems as root/sudo. As well, bundle install will
	# try to install to $GEM_HOME, however you may need to manually set a location like:
	#  $ bundle config set --local path ~/.gem/ruby/3.0.0/gems/
	# NOTE: for macOS on Apple Silicon https://github.com/BillRaymond/install-jekyll-apple-silicon/blob/main/README.md
	#  if you run into errors down the line, do uninstall step and reinstall here
	gem install --user-install bundler jekyll
	bundle install --jobs $(shell nproc)

serve: check-env
	rm -rf $(SITE_DIR)
	./notebook_to_markdown.py
	# Build static site and serve up locally, but automatically rebuild and reload if a tracked file is changed
	bundle exec jekyll serve --livereload --incremental --port $(SERVE_PORT)

test: check-env
	# Running simple HTTP Webserver to manually verify built distribution
ifeq ($(UNAME_S),Linux)
	sleep 1 && xdg-open http://localhost:$(SERVE_PORT)/ &
endif
ifeq ($(UNAME_S),Darwin)
	sleep 1 && open "http://localhost:$(SERVE_PORT)/" &
endif
	cd $(SITE_DIR) && $(PY_EXE) -m http.server $(SERVE_PORT)

update: check-env
	bundle update --all

uninstall:
	gem uninstall bundler jekyll

