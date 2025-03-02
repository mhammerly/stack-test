#!/bin/bash

git branch --list "branchless/*" | xargs git branch -D &
gh issue list -L 50 --json number --jq '.[].number' | xargs -L 1 gh issue close &
gh pr list -L 50 --json number --jq '.[].number' | xargs -L 1 gh pr close &

wait
