#!/bin/bash

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

echo_info() {
  echo_colored "blue" "INFO: $1"
}

echo_success() {
  echo_colored "green" "SUCCESS: $1"
}

echo_warning() {
  echo_colored "yellow" "WARNING: $1"
}

echo_error() {
  echo_colored "red" "ERROR: $1"
}

# Function to replace placeholders in files
replace_placeholders() {
  local dir=$1
  local app_name=$2
  local python_package_name=$3
  
  find "$dir" -type f -not -path "*/node_modules/*" -not -path "*/venv/*" -exec sed -i.bak "s/{{APP_NAME}}/$app_name/g" {} \;
  find "$dir" -type f -not -path "*/node_modules/*" -not -path "*/venv/*" -exec sed -i.bak "s/{{PYTHON_PACKAGE_NAME}}/$python_package_name/g" {} \;
  find "$dir" -name "*.bak" -delete
}
