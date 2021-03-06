# john-gentile-website

Repo for website [john-gentile.com](https://john-gentile.com/)

## Todo

* [ ] implement Travis CI to automate building process and checking of status. Integrate hooks to auto-build when merging into `master`?
* [ ] add `recipes/` to separate section of site

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
