#!/bin/bash

dir=$(LC_ALL=C tr -dc A-Za-z0-9 </dev/urandom | head -c 16)

mkdir $dir
cd $dir

echo 'Detaching from main...'
git switch --detach main

echo 'First commit...'
echo 'first file' > first_file
git add .
git commit -m 'add first file'

echo 'Second commit...'
echo 'second file' > second_file
git add .
git commit -m 'add second file'

echo 'Third commit...'
echo 'third file' > third_file
echo 'appending to second file' >> second_file
git add .
git commit -m 'add third, modify second file'

echo 'Fourth commit...'
echo 'fourth file' > fourth_file
echo 'appending to third file' >> third_file
echo 'replacing content of first file' > first_file
git rm second_file
git add .
git commit -m 'add fourth, modify third, replace first, remove second'

echo 'Going back to second commit to fork...'
git prev 2

echo 'Fifth commit (fork-3)...'
echo 'fifth file' > fifth_file
git add .
git commit -m 'add fifth file, begin forked stack'

echo 'Sixth commit (fork-4)...'
echo 'sixth file' > sixth_file
git rm fifth_file
git commit -m 'add sixth file, remove fifth'

echo 'Exiting...'
cd ..
git switch --detach main
git sl
