# Makefile for john-gentile.com
# To build, run `$ make` and to deploy to S3 run `$ make deploy`
#
# Author: John Gentile
# Date:   2/28/18

build:
	# Clean stale data
	rm -rf ./_site
	rm -rf ./dist
	# First generate pending TODO.md list then display to stdout
	gulp todo
	cat ./TODO.md
	# Generate resume PDF from docx (launched from another process in case libreoffice GUI is already open)
	# Edit path to libreoffice as necessary
	libreoffice5.4 --headless --convert-to pdf:writer_pdf_Export John_Gentile_Resume.docx "-env:UserInstallation=file:///tmp/LibreOffice_Conversion_${USER}" --outdir ./
	# Generate intermediate files from Jekyll
	bundle exec jekyll build
	# Run PostCSS to optimize and minimize CSS
	gulp css
	# Minify final image, JavaScript & HTML files
	gulp minify-img
	gulp minify-js
	gulp minify-html
	# Move over all other files
	gulp move-files
	# Write current git revision to file for tracking
	git rev-parse --short HEAD > revision
	mv revision ./dist/revision

clean:
	# Deleting generated files...
	rm Gemfile.lock
	rm -rf ./_site
	rm -rf ./dist
	rm -rf ./node_modules
	rm TODO.md
	rm John_Gentile_Resume.pdf
	rm .sass-cache
	rm .jekyll-metadata

# Jekyll should build before deploying to ensure site.url variables are used
# correctly (jekyll serve replaces site.url w/local host settings)
deploy: build
	# Deploying distribution to Amazon S3...
	aws s3 sync ./dist s3://john-gentile.com --delete

install:
	# Run before building on new system to install dependent packages or to
	# update local packages
	bundle install
	npm install

serve:
	# Funky workaround to get web browser to launch page after we build and
	# start the server since `jekyll serve` blocks till Ctrl+C. If building
	# takes longer than 5 seconds, adjust accordingly
	rm -rf ./_site
	sleep 5 && xdg-open http://localhost:4000/ &
	bundle exec jekyll serve

test:
	# Running simple HTTP Webserver to manually verify distribution
	sleep 1 && xdg-open http://localhost:8080/ &
	# If Python ver >3.x use `python -m http.server`
	# Change port from 8080 to other if necessary. Use Ctrl+C to stop...
	cd ./dist && python -m SimpleHTTPServer 8080
