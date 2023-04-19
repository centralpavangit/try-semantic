#!/bin/sh
if [ "$3" == "1" ]; then
  # Run setup script only on initial clone
  ./setup.sh
fi
mv .git/hooks/commit-msg.sample commit-msg
echo "
commit_msg_file=$1
commit_msg=`cat $commit_msg_file`

if ! echo "$commit_msg" | grep -qE '^(feat|fix|docs|style|refactor|perf|test|chore)(\(.+\))?: .{1,100}$'; then
  echo "Commit message does not follow the required format. Aborting commit."
  exit 1
fi" >> .git/hooks/commit-msg
