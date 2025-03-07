#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

echo_info "Would you like to initialize a git repository for this project? (y/n)"
read -p "> " INIT_GIT
if [[ "$INIT_GIT" =~ ^[Yy]$ ]]; then
  echo_info "Initializing git repository..."
  git init
  git add .
  git commit -m "Initial commit: Project scaffolding"
  
  echo_info "Would you like to add a remote origin? (y/n)"
  read -p "> " ADD_REMOTE
  if [[ "$ADD_REMOTE" =~ ^[Yy]$ ]]; then
    read -p "Enter the remote repository URL (e.g., https://github.com/username/repo.git): " REMOTE_URL
    if [[ -n "$REMOTE_URL" ]]; then
      git remote add origin "$REMOTE_URL"
      echo_success "Remote origin added. You can push your changes with 'git push -u origin master'."
    fi
  fi
fi
