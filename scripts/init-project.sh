#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils/common.sh"

# Prompt for app name
read -p "Enter your app name (e.g., my-app): " APP_NAME
while [[ -z "$APP_NAME" ]]; do
  echo_error "App name cannot be empty."
  read -p "Enter your app name (e.g., my-app): " APP_NAME
done

# Create project directory
echo_info "Creating project directory: $APP_NAME"
mkdir -p "$APP_NAME"
cd "$APP_NAME"

# Setup project structure
"$SCRIPT_DIR/utils/setup_structure.sh" "$APP_NAME"

# Setup git (optional)
"$SCRIPT_DIR/utils/setup_git.sh"

# Setup complete
cd ..
echo_success "Project setup complete!"
echo_info "To run your project:"
echo "  cd $APP_NAME"
echo "  ./scripts/run_project.sh"
