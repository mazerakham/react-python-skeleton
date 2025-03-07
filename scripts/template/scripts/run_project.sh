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

# Setup Python environment if it doesn't exist
if [ ! -d "$PROJECT_ROOT/backend/venv" ]; then
  echo_colored "yellow" "Setting up Python virtual environment..."
  cd "$PROJECT_ROOT/backend"
  
  # Try python3 first, then fall back to python if python3 is not available
  if command -v python3 &> /dev/null; then
    python3 -m venv venv
  else
    python -m venv venv
  fi
  
  source venv/bin/activate
  pip install -e .
  pip install -r requirements.txt
  cd "$PROJECT_ROOT"
fi

# Install frontend dependencies if node_modules doesn't exist
if [ ! -d "$PROJECT_ROOT/frontend/node_modules" ]; then
  echo_colored "yellow" "Installing frontend dependencies..."
  cd "$PROJECT_ROOT/frontend"
  npm install --legacy-peer-deps
  cd "$PROJECT_ROOT"
fi

echo_colored "green" "Starting {{APP_NAME}} application..."

# Run both backend and frontend using concurrently
cd "$PROJECT_ROOT/frontend"
./node_modules/.bin/concurrently \
  --kill-others \
  --prefix "[{name}]" \
  --names "backend,frontend" \
  --prefix-colors "yellow.bold,cyan.bold" \
  "cd $PROJECT_ROOT/backend && source venv/bin/activate && uvicorn {{PYTHON_PACKAGE_NAME}}.app:app --reload" \
  "npm start"
