# Makefile for john-gentile.com
# To build, run `$ make` and to deploy to S3 run `$ make deploy`

UNAME_S := $(shell uname -s)

build:
	# Clean stale data
	rm -rf ./_site
	rm -rf ./dist
	# First generate pending TODO.md list then display to stdout
	gulp todo
	cat ./TODO.md
	# Generate intermediate files from Jekyll (use additional publish configs)
	bundle exec jekyll build --config _config.yml,_config-publish.yml
	# Run PostCSS to optimize and minimize CSS
	gulp css
	# Minify final image, JavaScript & HTML files
	gulp minify-img
	gulp minify-js
	gulp minify-html
	# Move over all other files
	gulp move-files
	# Write current git revision to file for tracking
	git rev-parse HEAD > ./dist/revision

clean:
	# Deleting generated files...
	rm Gemfile.lock
	rm -rf ./_site
	rm -rf ./dist
	rm -rf ./node_modules
	rm TODO.md
	rm .sass-cache
	rm .jekyll-metadata

deploy:
	# Deploying distribution to Amazon S3...
	./deploy.sh

install:
	# Run before building on new system to install dependent packages or to
	# update local packages
ifeq ($(UNAME_S),Linux)
	gem install jekyll bundler
endif
ifeq ($(UNAME_S),Darwin)
	gem install --user-install bundler jekyll
endif
	bundle install
	npm install
	pip3 install awscli --upgrade --user

serve:
	rm -rf ./_site
	# Funky workaround to get web browser to launch page after we build and
	# start the server since `jekyll serve` blocks till Ctrl+C. If building
	# takes longer than 7 seconds, adjust accordingly
ifeq ($(UNAME_S),Linux)
	sleep 7 && xdg-open http://localhost:4000/ &
endif
ifeq ($(UNAME_S),Darwin)
	sleep 7 && open "http://localhost:4000/" &
endif
	bundle exec jekyll serve --livereload

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
	cd ./dist && python -m SimpleHTTPServer 8080

update:
	bundle update --all
	# updates locally used pkgs, use '# npm update -g' to update system wide pkgs
	npm update
	npm outdated
