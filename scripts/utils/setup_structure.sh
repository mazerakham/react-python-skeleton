#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

APP_NAME=$1
PYTHON_PACKAGE_NAME=$(echo "$APP_NAME" | tr '-' '_' | tr '[:upper:]' '[:lower:]')
TEMPLATE_DIR="$SCRIPT_DIR/../template"

# Create directory structure
echo_info "Creating directory structure..."
mkdir -p backend/src/$PYTHON_PACKAGE_NAME
mkdir -p backend/tests
mkdir -p frontend/src
mkdir -p frontend/scripts
mkdir -p scripts
mkdir -p cline
mkdir -p .vscode

# Copy template files
echo_info "Copying template files..."
cp -r "$TEMPLATE_DIR/.gitignore" ./
cp -r "$TEMPLATE_DIR/README.md" ./
cp -r "$TEMPLATE_DIR/backend/pytest.ini" backend/
cp -r "$TEMPLATE_DIR/backend/pyproject.toml" backend/
cp -r "$TEMPLATE_DIR/backend/poetry.toml" backend/
cp -r "$TEMPLATE_DIR/backend/src/{{PYTHON_PACKAGE_NAME}}/"* backend/src/$PYTHON_PACKAGE_NAME/
cp -r "$TEMPLATE_DIR/backend/tests/"* backend/tests/
cp -r "$TEMPLATE_DIR/frontend/"* frontend/
cp -r "$TEMPLATE_DIR/scripts/"* scripts/
cp -r "$TEMPLATE_DIR/cline/"* cline/
cp -r "$TEMPLATE_DIR/.vscode/"* .vscode/

# Replace placeholders in template files
echo_info "Configuring project files..."
replace_placeholders "." "$APP_NAME" "$PYTHON_PACKAGE_NAME"

# Make scripts executable
chmod +x scripts/*.sh
chmod +x frontend/scripts/*.sh

# Copy the Poetry installation script
cp "$SCRIPT_DIR/install_poetry.sh" scripts/

echo_success "Project structure setup complete"
