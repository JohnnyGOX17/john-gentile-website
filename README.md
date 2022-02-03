# john-gentile-website

Repo for website [john-gentile.com](https://john-gentile.com/)

## Todo

* [ ] complete GitHub action to automate building process and pushing to AWS S3 bucket:
  - [X] Use [GitHub repo secrets](https://dev.to/johnkevinlosito/deploy-static-website-to-s3-using-github-actions-4a0e) to push to S3 bucket [using AWS CLI action](https://github.com/aws-actions/configure-aws-credentials)
  - [ ] Figure out [Jekyll GitHub action to build static site](https://jekyllrb.com/docs/continuous-integration/github-actions/)
    + Currently running into dependency issues in Docker container it pulls down, maybe just make install script or custom docker container?
  - [ ] Figure out Gulp post-processing

## To Build

### Dependencies
- Install Ruby
  1) Install dependencies for up-to-date Ruby:
    + e.g. `$ sudo yum install git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel`
  2) Install Ruby with `rbenv` using `$ curl -sL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash -`
  3) Make sure `.bashrc` has path to `rbenv` and init script
  4) Install Ruby 2.5.1 and set as default with `$ rbenv install 2.5.1 && rbenv global 2.5.1`
- Install Gem Bundler with `$ gem install bundle`
- Run `$ make install` to get Gem & NPM packages

## To Deploy

_Note:_ AWS CLI is used to sync local built files to the Amazon S3 bucket used for hosting the static website. If not already configured, configure the CLI following the [AWS CLI User Guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)

## References

* [Jekyll Docs](https://jekyllrb.com/docs/)

