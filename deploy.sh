#!/bin/bash
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
# hugo # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public || exit
# Add changes to git.
git add -A

# Add git config
git config user.name "Travis CI"
git config user.email "dylan.pinn@gmail.com"

git remote rm origin
git remote add origin https://the-mysterious-larks:${GH_TOKEN}@github.com/the-mysterious-larks/the-mysterious-larks.github.io.git

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master --force

# Come Back
cd ..
