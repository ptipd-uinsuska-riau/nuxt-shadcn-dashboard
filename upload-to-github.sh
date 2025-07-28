#!/bin/bash

# ==============================================
# UPLOAD TO GITHUB SCRIPT
# ==============================================
# Script untuk upload template ke repository GitHub baru

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
echo "🚀 UPLOAD TO GITHUB SCRIPT"
echo "=================================================="
echo -e "${NC}"

# Check if git is installed
if ! command -v git &> /dev/null; then
    print_error "Git is not installed. Please install Git first."
    exit 1
fi

# Get repository URL from user
echo "Masukkan URL repository GitHub baru Anda:"
echo "Format: https://github.com/USERNAME/REPOSITORY-NAME.git"
read -p "Repository URL: " REPO_URL

if [ -z "$REPO_URL" ]; then
    print_error "Repository URL tidak boleh kosong!"
    exit 1
fi

# Validate URL format
if [[ ! "$REPO_URL" =~ ^https://github\.com/.+/.+\.git$ ]]; then
    print_error "Format URL tidak valid! Gunakan format: https://github.com/USERNAME/REPOSITORY-NAME.git"
    exit 1
fi

# Extract username and repo name for display
USERNAME=$(echo "$REPO_URL" | sed 's/https:\/\/github\.com\/\([^\/]*\)\/.*/\1/')
REPO_NAME=$(echo "$REPO_URL" | sed 's/.*\/\([^\/]*\)\.git/\1/')

print_status "Repository: $USERNAME/$REPO_NAME"
print_status "URL: $REPO_URL"

# Confirm with user
echo ""
read -p "Apakah informasi di atas sudah benar? (y/N): " CONFIRM

if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    print_warning "Upload dibatalkan."
    exit 0
fi

print_status "Memulai upload ke GitHub..."

# Add remote origin
print_status "Menambahkan remote origin..."
git remote add origin "$REPO_URL"
print_success "Remote origin berhasil ditambahkan"

# Push to GitHub
print_status "Uploading ke GitHub..."
if git push -u origin main; then
    print_success "Upload berhasil!"
else
    print_error "Upload gagal. Pastikan:"
    echo "1. Repository sudah dibuat di GitHub"
    echo "2. Repository kosong (tidak ada file README, .gitignore, dll)"
    echo "3. Anda memiliki akses write ke repository"
    echo "4. Git credentials sudah dikonfigurasi"

    # Remove the remote if push failed
    git remote remove origin
    exit 1
fi

echo -e "${GREEN}"
echo "=================================================="
echo "✅ UPLOAD BERHASIL!"
echo "=================================================="
echo -e "${NC}"

echo "Repository Anda sekarang tersedia di:"
echo "🔗 $REPO_URL"
echo ""
echo "Langkah selanjutnya:"
echo "1. Buka repository di GitHub"
echo "2. Buka Settings > General"
echo "3. Centang 'Template repository' untuk menjadikannya template"
echo "4. Setup GitHub Pages jika diperlukan"
echo ""
echo "Template JavaScript + Yarn siap digunakan! 🎉"
