#!/bin/bash
# File              : deploy.sh
# Author            : John Gentile <johncgentile17@gmail.com>
# Date              : 07.03.2018
# Last Modified Date: 07.03.2018
# Last Modified By  : John Gentile <johncgentile17@gmail.com>
#
# Jekyll and other make processes should build before deploying to ensure
# site.url variables are used correctly (jekyll serve replaces site.url w/local
# host settings)

currGitRev="$(git rev-parse HEAD)"
distGitRev="$(cat ./dist/revision)"

syncAWS() {
  aws s3 sync ./dist s3://john-gentile.com --delete
  echo "DONE!"
}

if [ "${currGitRev}" == "${distGitRev}" ]; then
  echo "Current & Distribution Git revisions match. Syncing files with AWS server..."
  syncAWS
else
  currTime="$(git log -1 --format="%ar" ${currGitRev})"
  distTime="$(git log -1 --format="%ar" ${distGitRev})"
  echo "Distribution's Git revision [${distGitRev}] is from ${distTime} and doesn't match the current Git revision [${currGitRev}] committed ${currTime}."
  read -p "Do you want to rebuild and then deploy to AWS? [y/n]: " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    make
    syncAWS
  else
    read -p "Do you want to deploy to AWS anyways? [y/n]: " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      syncAWS
    else
      exit 1
    fi
  fi
fi
