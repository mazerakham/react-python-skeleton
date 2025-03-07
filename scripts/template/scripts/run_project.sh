#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Function to display colored output
echo_colored() {
  local color=$1
  local message=$2
  case $color in
    "green") echo -e "\033[0;32m$message\033[0m" ;;
    "blue") echo -e "\033[0;34m$message\033[0m" ;;
    "yellow") echo -e "\033[0;33m$message\033[0m" ;;
    "red") echo -e "\033[0;31m$message\033[0m" ;;
    *) echo "$message" ;;
  esac
}

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
  echo_colored "red" "tmux is not installed. Please install it to run this script."
  echo "On macOS: brew install tmux"
  echo "On Ubuntu: sudo apt-get install tmux"
  exit 1
fi

# Create a new tmux session
SESSION_NAME="{{APP_NAME}}"
tmux new-session -d -s "$SESSION_NAME"

# Split the window horizontally
tmux split-window -h -t "$SESSION_NAME"

# Run backend in the left pane
tmux send-keys -t "$SESSION_NAME:0.0" "cd $PROJECT_ROOT/backend && uvicorn {{PYTHON_PACKAGE_NAME}}.app:app --reload" C-m

# Run frontend in the right pane
tmux send-keys -t "$SESSION_NAME:0.1" "cd $PROJECT_ROOT/frontend && npm start" C-m

# Attach to the session
echo_colored "green" "Starting {{APP_NAME}} application..."
echo_colored "yellow" "Press Ctrl+B then D to detach from tmux session without stopping the servers."
tmux attach-session -t "$SESSION_NAME"
