#!/bin/bash
git add .
echo "git commit -m :"
read var
echo $var
git commit -m $var
git push -u origin master
