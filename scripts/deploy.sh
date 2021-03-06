#!/bin/bash

(echo "$(tput setaf 4)########## CREATING DEPLOY BRANCH ##########$(tput sgr 0)")
(git checkout -b deploy-branch)
(echo "$(tput setaf 4)########## CLEANING BUNDLE DIRECTORY ##########$(tput sgr 0)")
(rm -rf ./public/assets/bundle)
(echo "$(tput setaf 4)########## RUNNING WEBPACK IN PRODUCTION ##########$(tput sgr 0)")
(webpack --config ./config/webpack/production.config.js)
(echo "$(tput setaf 4)########## RUNNING WEBPACK RAKE TASK ##########$(tput sgr 0)")
(rake webpack:compile)
(echo "$(tput setaf 4)########## PUSHING TO HEROKU ##########$(tput sgr 0)")
(git add .)
(git commit -m "DEPLOY COMMIT")
(git push -f production deploy-branch:master)
(git checkout master)
(echo "$(tput setaf 4)########## CLEANING UP DEPLOY BRANCH ##########$(tput sgr 0)")
(git branch -D deploy-branch)
