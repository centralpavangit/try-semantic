#!/bin/sh

commit_msg_file=$1
commit_msg=`cat $commit_msg_file`

if ! echo "$commit_msg" | grep -qE '^(feat|fix|docs|style|refactor|perf|test|chore)(\(.+\))?: .{1,100}$'; then
  echo "Commit message does not follow the required format. Aborting commit."
  exit 1
fi
