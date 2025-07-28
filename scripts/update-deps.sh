#!/bin/bash

# ==============================================
# DEPENDENCY UPDATE SCRIPT - Nuxt ShadCN Starter Template
# ==============================================
# This script helps update dependencies safely

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

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo -e "${BLUE}"
echo "=================================================="
echo "📦 DEPENDENCY UPDATE SCRIPT"
echo "=================================================="
echo -e "${NC}"

# Detect package manager
print_status "Detecting package manager..."
if [ -f "yarn.lock" ]; then
    PACKAGE_MANAGER="yarn"
elif [ -f "pnpm-lock.yaml" ]; then
    PACKAGE_MANAGER="pnpm"
elif [ -f "package-lock.json" ]; then
    PACKAGE_MANAGER="npm"
else
    PACKAGE_MANAGER="npm"
fi

print_success "Using package manager: $PACKAGE_MANAGER"

# Backup current package.json
print_status "Creating backup of package.json..."
cp package.json package.json.backup
print_success "Backup created: package.json.backup"

# Function to update dependencies
update_dependencies() {
    case $PACKAGE_MANAGER in
        "yarn")
            if command_exists yarn; then
                print_status "Updating dependencies with Yarn..."
                yarn upgrade-interactive
            else
                print_error "Yarn not found, falling back to npm"
                npm update
            fi
            ;;
        "pnpm")
            if command_exists pnpm; then
                print_status "Updating dependencies with PNPM..."
                pnpm update -i
            else
                print_error "PNPM not found, falling back to npm"
                npm update
            fi
            ;;
        *)
            print_status "Updating dependencies with NPM..."
            npm update
            ;;
    esac
}

# Function to check for outdated packages
check_outdated() {
    print_status "Checking for outdated packages..."
    case $PACKAGE_MANAGER in
        "yarn")
            if command_exists yarn; then
                yarn outdated || true
            fi
            ;;
        "pnpm")
            if command_exists pnpm; then
                pnpm outdated || true
            fi
            ;;
        *)
            npm outdated || true
            ;;
    esac
}

# Function to audit dependencies
audit_dependencies() {
    print_status "Running security audit..."
    case $PACKAGE_MANAGER in
        "yarn")
            if command_exists yarn; then
                yarn audit || true
            fi
            ;;
        "pnpm")
            if command_exists pnpm; then
                pnpm audit || true
            fi
            ;;
        *)
            npm audit || true
            ;;
    esac
}

# Main execution
if [ "$1" = "--check" ] || [ "$1" = "-c" ]; then
    check_outdated
elif [ "$1" = "--audit" ] || [ "$1" = "-a" ]; then
    audit_dependencies
elif [ "$1" = "--interactive" ] || [ "$1" = "-i" ]; then
    update_dependencies
else
    print_status "Available options:"
    echo "  --check, -c      Check for outdated packages"
    echo "  --audit, -a      Run security audit"
    echo "  --interactive, -i Update dependencies interactively"
    echo ""
    echo "Example: ./scripts/update-deps.sh --check"
fi

# Test build after updates
if [ "$1" = "--interactive" ] || [ "$1" = "-i" ]; then
    print_status "Testing build after updates..."
    if npm run build; then
        print_success "Build successful after updates!"
    else
        print_error "Build failed after updates. Consider restoring backup."
        print_warning "Backup available at: package.json.backup"
    fi
fi

echo -e "${GREEN}"
echo "=================================================="
echo "✅ DEPENDENCY UPDATE COMPLETED!"
echo "=================================================="
echo -e "${NC}"
