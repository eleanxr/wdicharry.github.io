#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Specify the post title"
    exit -1
fi

TITLE="$1"
DATE=$(date +%Y-%m-%d)

POST_NAME=$DATE-$(echo $TITLE | awk '{print tolower($0)}').markdown
POST_NAME=$(echo $POST_NAME | sed 's/ /-/g')
POST_NAME="_posts/$POST_NAME"

echo "---" > $POST_NAME
echo "layout: post" >> $POST_NAME
echo "title: \"$TITLE\"" >> $POST_NAME
echo "date: $DATE $(date +%T)" >> $POST_NAME
echo "categories: uncategorized" >> $POST_NAME
echo "---" >> $POST_NAME 
