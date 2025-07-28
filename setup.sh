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

# Detect package manager
print_status "Detecting package manager..."
if [ -f "yarn.lock" ]; then
    PACKAGE_MANAGER="yarn"
elif [ -f "pnpm-lock.yaml" ]; then
    PACKAGE_MANAGER="pnpm"
elif [ -f "package-lock.json" ]; then
    PACKAGE_MANAGER="npm"
else
    # Default to npm if no lock file exists
    PACKAGE_MANAGER="npm"
fi

print_success "Using package manager: $PACKAGE_MANAGER"

# Install dependencies
print_status "Installing dependencies..."
case $PACKAGE_MANAGER in
    "yarn")
        if command_exists yarn; then
            yarn install
        else
            print_error "Yarn is not installed. Installing with npm instead..."
            npm install
        fi
        ;;
    "pnpm")
        if command_exists pnpm; then
            pnpm install
        else
            print_error "PNPM is not installed. Installing with npm instead..."
            npm install
        fi
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
echo "2. Run 'npm run dev' (or 'yarn dev'/'pnpm dev') to start development server"
echo "3. Open http://localhost:3000 in your browser"
echo ""
echo "Available commands:"
echo "  npm run dev      - Start development server"
echo "  npm run build    - Build for production"
echo "  npm run preview  - Preview production build"
echo "  npm run lint     - Run ESLint"
echo "  npm run format   - Format code with ESLint"
echo ""
echo "Happy coding! 🎉"
