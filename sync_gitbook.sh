#!/bin/bash

gitbook build

message=`git show -s --format=%s`

cp -rf _book/* ../gitbook/

cd ../gitbook

git status

git add .

git commit -m $message

git push
