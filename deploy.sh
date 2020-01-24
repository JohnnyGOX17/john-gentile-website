#!/bin/bash
#
# Jekyll and other make processes should build before deploying to ensure
# site.url variables are used correctly (jekyll serve replaces site.url w/local
# host settings)
#
# If not done yet, setup AWS CLI using keys:
# https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html

currGitRev="$(git rev-parse HEAD)"
pubGitRev="$(curl -s https://john-gentile.com/revision)"

syncAWS() {
  aws s3 sync ./dist s3://john-gentile.com --delete
  echo "AWS Sync Successful!"
}

if [ "${currGitRev}" == "${pubGitRev}" ]; then
  echo "Local & Published website Git revisions match."
  read -p "Do you want to rebuild and then deploy to AWS anyways? [y/n]: " -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    make && syncAWS
  else
    echo ""
    exit 1
  fi
else
  currTime="$(git log -1 --format="%ar" ${currGitRev})"
  pubTime="$(git log -1 --format="%ar" ${pubGitRev})"
  echo "Published website's Git revision [${pubGitRev}] is from ${pubTime} and doesn't match the current Git revision [${currGitRev}] committed ${currTime}."
  read -p "Do you want to build and then deploy to AWS? [y/n]: " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    make && syncAWS
  else
    read -p "Do you want to deploy current dist/ build to AWS anyways? [y/n]: " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      syncAWS
    else
      echo ""
      exit 1
    fi
  fi
fi
