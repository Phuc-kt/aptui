#!/bin/bash

set -e

BLUE='\033[0;34m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║${NC}     APTUI - APT Package Manager TUI     ${BLUE}║${NC}"
echo -e "${BLUE}║${NC}           Installation Script            ${BLUE}║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Check if running with sudo or root
if [ "$EUID" -ne 0 ]; then
  echo -e "${YELLOW}ⓘ${NC} This script requires root privileges."
  exec sudo "$0" "$@"
fi

# Color codes for messages
print_checking() {
  echo -e "${YELLOW}⏳${NC} $1"
}

print_success() {
  echo -e "${GREEN}✓${NC} $1"
}

print_error() {
  echo -e "${RED}✗${NC} $1"
}

# Check if apt is available
print_checking "Checking APT availability..."
if ! command -v apt &>/dev/null; then
  print_error "APT is not available on this system."
  echo "This tool only supports distributions with APT (Debian, Ubuntu, Linux Mint, etc.)"
  exit 1
fi
print_success "APT is available"

# Update package manager
print_checking "Updating package manager..."
apt update > /dev/null 2>&1 || {
  print_error "Failed to update package manager"
  exit 1
}
print_success "Package manager updated"

# Install dependencies
MISSING_DEPS=()

print_checking "Checking dependencies..."
if ! command -v fzf &>/dev/null; then
  MISSING_DEPS+=("fzf")
fi

if ! command -v axi-cache &>/dev/null; then
  MISSING_DEPS+=("apt-xapian-index")
fi

if [ ${#MISSING_DEPS[@]} -gt 0 ]; then
  print_checking "Installing missing dependencies: ${MISSING_DEPS[*]}"
  apt install -y "${MISSING_DEPS[@]}" > /dev/null 2>&1 || {
    print_error "Failed to install dependencies"
    exit 1
  }
  print_success "Dependencies installed successfully"
else
  print_success "All dependencies are already installed"
fi

# Update apt-xapian-index database
print_checking "Updating apt-xapian-index database..."
update-apt-xapian-index > /dev/null 2>&1 || {
  print_error "Failed to update apt-xapian-index"
  exit 1
}
print_success "apt-xapian-index database updated"

# Find the script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if aptui script exists
if [ ! -f "$SCRIPT_DIR/aptui" ]; then
  print_error "aptui script not found in $SCRIPT_DIR"
  exit 1
fi

# Copy aptui to /usr/local/bin
print_checking "Installing aptui to /usr/local/bin..."
cp "$SCRIPT_DIR/aptui" /usr/local/bin/aptui || {
  print_error "Failed to copy aptui script"
  exit 1
}

# Make it executable
chmod +x /usr/local/bin/aptui || {
  print_error "Failed to make aptui executable"
  exit 1
}
print_success "aptui installed successfully"

# Verify installation
print_checking "Verifying installation..."
if command -v aptui &>/dev/null; then
  print_success "Installation verified"
else
  print_error "Installation verification failed"
  exit 1
fi

echo ""
echo "You can now use aptui with these commands:"
echo -e "  ${BLUE}aptui${NC}           - Open package search"
echo ""

