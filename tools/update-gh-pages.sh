#!/bin/sh

set -e

doxygen

WORKDIR=gh-pages
ORIGINURL=`git remote get-url origin`

git clone --depth 1 -b gh-pages ${ORIGINURL} ${WORKDIR}
cd ${WORKDIR}
rm -f *
cp -r ../api-doc/* .
git add *
git commit -a -m "Update of API documentation"
echo Now perform \"git push\" from ${WORKDIR}
