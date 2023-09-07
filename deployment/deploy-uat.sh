#!/bin/sh -l

git clone https://token:${{ secrets.API_GITHUB_TOKEN }}@github.com/paulopanini/microservice-configurations.git
cd microservice-configurations/demo
git remote set-url origin https://token:${{ secrets.API_GITHUB_TOKEN }}@github.com/paulopanini/microservice-configurations.git
git config --global user.email "backstage@benify.com"
git config --global user.name "backstage"
sed -i -E "s/(hello-world:)[a-z|0-9]*/demo:$CI_COMMIT_SHORT_SHA/g" deployment.yaml
git add .
git commit -m "Deploy $CI_COMMIT_TIMESTAMP"
git push
