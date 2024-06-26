# Makefile for john-gentile.com
# To build, run `$ make` and to deploy to S3 run `$ make deploy`

UNAME_S := $(shell uname -s)

.SILENT: clean serve test

build:
	# Clean stale data
	rm -rf ./_site
	./notebook_to_markdown.py
	# Generate intermediate files from Jekyll (use additional publish configs)
	bundle exec jekyll build --config _config.yml,_config-publish.yml
	# Write current git revision to file for tracking
	git rev-parse HEAD > ./_site/revision

clean:
	# Deleting generated files...
	rm -rf ./_site
	rm -f TODO.md
	rm -f .sass-cache
	rm -f .jekyll-metadata

deploy:
	# Deploying distribution to Amazon S3...
	./deploy.sh

install:
	# Run before building on new system to install dependent packages or to
	# update local packages
	# NOTE: for Linux, don't install gems as root/sudo. As well, bundle install will
	# try to install to $GEM_HOME, however you may need to manually set a location like:
	#  $ bundle config set --local path ~/.gem/ruby/3.0.0/gems/
	# NOTE: for macOS on Apple Silicon https://github.com/BillRaymond/install-jekyll-apple-silicon/blob/main/README.md
	#  if you run into errors down the line, do uninstall step and reinstall here
	gem install --user-install bundler jekyll
	bundle install --jobs $(shell nproc)
	python3 -m venv .venv
	source .venv/bin/activate
	python3 -m pip install -r requirements.txt

serve:
	rm -rf ./_site
	./notebook_to_markdown.py
	# Build static site and serve up locally, but automatically rebuild and reload if a tracked file is changed
	bundle exec jekyll serve --livereload --incremental

test:
	# Running simple HTTP Webserver to manually verify built distribution
ifeq ($(UNAME_S),Linux)
	sleep 1 && xdg-open http://localhost:8080/ &
endif
ifeq ($(UNAME_S),Darwin)
	sleep 1 && open "http://localhost:8080/" &
endif
	# If Python ver >3.x use `python -m http.server`
	# Change port from 8080 to other if necessary. Use Ctrl+C to stop...
	cd ./_site && python -m SimpleHTTPServer 8080

update:
	bundle update --all

uninstall:
	gem uninstall bundler jekyll

