#!/bin/sh -l

set -e

echo "\npwd\n" 
pwd

echo "\nls\n"
ls

if [ -z "$FIREBASE_TOKEN" ]; then
    echo "FIREBASE_TOKEN is required to run commands with the firebase cli"
    exit 126
fi

if [ -n "$PROJECT_PATH" ]; then
    cd $PROJECT_PATH
fi

if [ -n "$PROJECT_ID" ]; then
    echo "setting firebase project to $PROJECT_ID"
    firebase use --add $PROJECT_ID
fi

echo "\nproject path is:" $PROJECT_PATH "\n"

echo "\npwd\n" 
pwd

echo "\nls\n"
ls

echo "\nnow running firebase actions\n"
sh -c "firebase $*"
