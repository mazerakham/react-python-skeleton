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
mkdir -p backend/test
mkdir -p frontend/src
mkdir -p scripts
mkdir -p cline

# Copy template files
echo_info "Copying template files..."
cp -r "$TEMPLATE_DIR/backend/pytest.ini" backend/
cp -r "$TEMPLATE_DIR/backend/requirements.txt" backend/
cp -r "$TEMPLATE_DIR/backend/setup.py" backend/
cp -r "$TEMPLATE_DIR/backend/src/{{PYTHON_PACKAGE_NAME}}/"* backend/src/$PYTHON_PACKAGE_NAME/
cp -r "$TEMPLATE_DIR/backend/test/"* backend/test/
cp -r "$TEMPLATE_DIR/frontend/"* frontend/
cp -r "$TEMPLATE_DIR/scripts/"* scripts/
cp -r "$TEMPLATE_DIR/cline/"* cline/

# Replace placeholders in template files
echo_info "Configuring project files..."
replace_placeholders "." "$APP_NAME" "$PYTHON_PACKAGE_NAME"

# Make scripts executable
chmod +x scripts/*.sh

echo_success "Project structure setup complete"
