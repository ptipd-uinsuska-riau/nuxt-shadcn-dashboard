#!/bin/bash

# ==============================================
# NUXT SHADCN STARTER TEMPLATE - SETUP SCRIPT
# ==============================================
# This script helps you set up the project quickly

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
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

# Welcome message
echo -e "${BLUE}"
echo "=================================================="
echo "🚀 NUXT SHADCN STARTER TEMPLATE SETUP"
echo "=================================================="
echo -e "${NC}"

# Check Node.js version
print_status "Checking Node.js version..."
if command_exists node; then
    NODE_VERSION=$(node --version)
    print_success "Node.js found: $NODE_VERSION"

    # Check if Node.js version is 18 or higher
    NODE_MAJOR_VERSION=$(echo $NODE_VERSION | cut -d'.' -f1 | sed 's/v//')
    if [ "$NODE_MAJOR_VERSION" -lt 18 ]; then
        print_warning "Node.js version 18 or higher is recommended. Current: $NODE_VERSION"
    fi
else
    print_error "Node.js is not installed. Please install Node.js 18+ from https://nodejs.org/"
    exit 1
fi

# Use Yarn as the preferred package manager
print_status "Using Yarn as package manager..."
PACKAGE_MANAGER="yarn"

# Check if Yarn is installed
if ! command_exists yarn; then
    print_warning "Yarn is not installed. Installing Yarn..."
    npm install -g yarn
    if [ $? -eq 0 ]; then
        print_success "Yarn installed successfully!"
    else
        print_error "Failed to install Yarn. Falling back to npm."
        PACKAGE_MANAGER="npm"
    fi
fi

print_success "Using package manager: $PACKAGE_MANAGER"

# Install dependencies
print_status "Installing dependencies..."
case $PACKAGE_MANAGER in
    "yarn")
        yarn install
        ;;
    *)
        npm install
        ;;
esac

print_success "Dependencies installed successfully!"

# Setup environment file
print_status "Setting up environment file..."
if [ ! -f ".env" ]; then
    cp .env.example .env
    print_success "Created .env file from .env.example"
    print_warning "Please edit .env file with your actual configuration values"
else
    print_warning ".env file already exists. Skipping..."
fi

# Git initialization (if not already a git repo)
if [ ! -d ".git" ]; then
    print_status "Initializing Git repository..."
    git init
    git add .
    git commit -m "🎉 Initial commit: Nuxt ShadCN Starter Template"
    print_success "Git repository initialized with initial commit"
else
    print_warning "Git repository already exists. Skipping initialization..."
fi

# Final instructions
echo -e "${GREEN}"
echo "=================================================="
echo "✅ SETUP COMPLETED SUCCESSFULLY!"
echo "=================================================="
echo -e "${NC}"

echo "Next steps:"
echo "1. Edit .env file with your configuration"
echo "2. Run 'yarn dev' to start development server"
echo "3. Open http://localhost:3000 in your browser"
echo ""
echo "Available commands:"
echo "  yarn dev         - Start development server"
echo "  yarn build       - Build for production"
echo "  yarn preview     - Preview production build"
echo "  yarn lint        - Run ESLint"
echo "  yarn format      - Format code with ESLint"
echo "  yarn clean       - Clean build artifacts"
echo "  yarn update-deps - Update dependencies"
echo ""
echo "Happy coding! 🎉"
