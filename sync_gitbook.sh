#!/bin/bash

echo "** gitbook build start"

gitbook build

message=`git show -s --format=%s`


echo "** copy doc to gitbook"

cp -rf _book/* ../gitbook/


echo "** push doc to github"

cd ../gitbook

git pull

git add .

git commit -m '${message}'

git push
