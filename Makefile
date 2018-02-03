# Makefile for john-gentile.com
# To build, run `$ make` and to deploy to S3 run `$ make deploy`
# Author: John Gentile
# Date:   1/30/18

build:
	# Building...
	rm -rf ./_site
	bundle exec jekyll build
	# TODO: add gulp stuff after HTML made and live preview outside of jekyll serve?

clean:
	# Deleting generated files...
	rm Gemfile.lock
	rm -rf ./_site
	rm -rf ./node_modules
	rm .sass-cache
	rm .jekyll-metadata

# Jekyll should build before deploying to ensure site.url variables are used
# correctly (jekyll serve replaces site.url w/local host settings)
deploy: build
	# Deploying to Amazon S3...
	aws s3 sync ./_site s3://john-gentile.com --delete

serve:
	# Funky workaround to get web browser to launch page after we build and
	# start the server since `jekyll serve` blocks till Ctrl+C. If building
	# takes longer than 5 seconds, adjust accordingly
	rm -rf ./_site
	sleep 5 && xdg-open http://localhost:4000/ &
	bundle exec jekyll serve

install:
	# Run before building on new system to install dependent packages or to
	# update local packages
	bundle install
	npm install
