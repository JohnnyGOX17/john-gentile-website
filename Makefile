
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

deploy:
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
