#!/bin/bash

echo "** gitbook build start"

gitbook build

message=`git show -s --format=%s`

echo "** pull remote doc"

cd ../gitbook

git pull


echo "** copy doc to gitbook"

cp -rf ../gitbook_src/_book/* ./


echo "** push doc to github"

git add .

git commit -m "${message}"

git push
