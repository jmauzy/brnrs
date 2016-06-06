#!/bin/bash

(git checkout -b deploy-branch)
(rm -rf ./public/assets/bundle)
(webpack --config ./config/webpack/production.config.js)
(rake webpack:compile)
(git add .)
(git commit -m "DEPLOY COMMIT")
(git push -f heroku deploy-branch:master)
(git checkout master)
(git branch -D deploy-branch)
