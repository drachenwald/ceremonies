#!/bin/bash

eval $(ssh-agent -s)
mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo "$SSH_KNOWN_HOSTS" > ~/.ssh/known_hosts
chmod 644 ~/.ssh/known_hosts
echo "${OVH_PRIVATE}" | tr -d '\r' | ssh-add - > /dev/null

if [ -n $GITHUB_REF_NAME ]
then
  if [ "$GITHUB_REF_NAME" == "main" ]
  then
    echo "Deploying main site"
    rsync -rvzc --exclude '.htaccess' --delete -e 'ssh -p 45333' public/ $WEBHOST_OVH:ceremonies/public/
    rsync -rvzc --delete -e 'ssh -p 45333' public/.htaccess $WEBHOST_OVH:ceremonies/
  else
    echo "No branch specified"
  fi
else
  echo "No branch specified"
fi

