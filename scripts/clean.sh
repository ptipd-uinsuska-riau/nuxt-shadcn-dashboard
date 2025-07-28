#!/bin/bash

# ==============================================
# CLEANUP SCRIPT - Nuxt ShadCN Starter Template
# ==============================================
# This script cleans up build artifacts and cache files

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

echo -e "${BLUE}"
echo "=================================================="
echo "🧹 CLEANUP SCRIPT"
echo "=================================================="
echo -e "${NC}"

# Function to remove directory if it exists
remove_if_exists() {
    if [ -d "$1" ]; then
        print_status "Removing $1..."
        rm -rf "$1"
        print_success "Removed $1"
    else
        print_warning "$1 does not exist, skipping..."
    fi
}

# Function to remove file if it exists
remove_file_if_exists() {
    if [ -f "$1" ]; then
        print_status "Removing $1..."
        rm -f "$1"
        print_success "Removed $1"
    else
        print_warning "$1 does not exist, skipping..."
    fi
}

# Clean Nuxt build artifacts
print_status "Cleaning Nuxt build artifacts..."
remove_if_exists ".nuxt"
remove_if_exists ".output"
remove_if_exists "dist"
remove_if_exists ".nitro"

# Clean cache directories
print_status "Cleaning cache directories..."
remove_if_exists ".cache"
remove_if_exists "node_modules/.cache"
remove_if_exists ".eslintcache"

# Clean temporary files
print_status "Cleaning temporary files..."
remove_if_exists "tmp"
remove_if_exists "temp"

# Clean log files
print_status "Cleaning log files..."
remove_file_if_exists "npm-debug.log"
remove_file_if_exists "yarn-debug.log"
remove_file_if_exists "yarn-error.log"
find . -name "*.log" -type f -delete 2>/dev/null || true

# Clean OS specific files
print_status "Cleaning OS specific files..."
find . -name ".DS_Store" -type f -delete 2>/dev/null || true
find . -name "Thumbs.db" -type f -delete 2>/dev/null || true
find . -name "Desktop.ini" -type f -delete 2>/dev/null || true

# Clean editor files
print_status "Cleaning editor temporary files..."
find . -name "*.swp" -type f -delete 2>/dev/null || true
find . -name "*.swo" -type f -delete 2>/dev/null || true
find . -name "*~" -type f -delete 2>/dev/null || true

# Option to clean node_modules
if [ "$1" = "--all" ] || [ "$1" = "-a" ]; then
    print_warning "Removing node_modules (this will require reinstalling dependencies)..."
    remove_if_exists "node_modules"
    remove_file_if_exists "package-lock.json"
    remove_file_if_exists "yarn.lock"
    remove_file_if_exists "pnpm-lock.yaml"
fi

echo -e "${GREEN}"
echo "=================================================="
echo "✅ CLEANUP COMPLETED!"
echo "=================================================="
echo -e "${NC}"

if [ "$1" = "--all" ] || [ "$1" = "-a" ]; then
    echo "Next steps:"
    echo "1. Run 'npm install' to reinstall dependencies"
    echo "2. Run 'npm run dev' to start development server"
else
    echo "Run with --all or -a flag to also remove node_modules and lock files"
fi
