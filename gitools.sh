#!/bin/bash

GUM=$(echo -e "Commit\nPush" | gum filter)

# Check if the user selected a commit or push but check if a .git folder exists
if [[ $GUM == "Commit" ]]; then
  if repoExists; then
    echo "Committing"
  else
    echo "Not a git repository"
    exit 1
  fi
  GIT_MSG_TITLE=$(gum input --placeholder "Title ")
  GIT_MSG_DESC=$(gum input --placeholder "Description (can be blank)")
  while [[ -z $GIT_MSG_TITLE ]]; do
    GIT_MSG_TITLE=$(gum input --placeholder "No title given, please enter a title to commit")
  done
  git commit -m "$GIT_MSG_TITLE" -m "$GIT_MSG_DESC"
  echo '1'
fi

function repoExists() {
  if [[ -d .git ]]; then
    true
  else
    false
  fi
}
