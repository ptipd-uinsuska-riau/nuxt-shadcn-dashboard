@echo off
setlocal enabledelayedexpansion

REM ==============================================
REM UPLOAD TO GITHUB SCRIPT (Windows)
REM ==============================================
REM Script untuk upload template ke repository GitHub baru

echo.
echo ==================================================
echo 🚀 UPLOAD TO GITHUB SCRIPT
echo ==================================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Git is not installed. Please install Git first.
    pause
    exit /b 1
)

REM Get repository URL from user
echo Masukkan URL repository GitHub baru Anda:
echo Format: https://github.com/USERNAME/REPOSITORY-NAME.git
set /p REPO_URL="Repository URL: "

if "!REPO_URL!"=="" (
    echo [ERROR] Repository URL tidak boleh kosong!
    pause
    exit /b 1
)

REM Basic URL validation
echo !REPO_URL! | findstr /C:"https://github.com/" >nul
if errorlevel 1 (
    echo [ERROR] Format URL tidak valid! Gunakan format: https://github.com/USERNAME/REPOSITORY-NAME.git
    pause
    exit /b 1
)

echo [INFO] Repository URL: !REPO_URL!
echo.

REM Confirm with user
set /p CONFIRM="Apakah informasi di atas sudah benar? (y/N): "
if /i not "!CONFIRM!"=="y" (
    echo [WARNING] Upload dibatalkan.
    pause
    exit /b 0
)

echo [INFO] Memulai upload ke GitHub...

REM Add remote origin
echo [INFO] Menambahkan remote origin...
git remote add origin "!REPO_URL!"
if errorlevel 1 (
    echo [ERROR] Gagal menambahkan remote origin.
    pause
    exit /b 1
)
echo [SUCCESS] Remote origin berhasil ditambahkan

REM Push to GitHub
echo [INFO] Uploading ke GitHub...
git push -u origin main
if errorlevel 1 (
    echo [ERROR] Upload gagal. Pastikan:
    echo 1. Repository sudah dibuat di GitHub
    echo 2. Repository kosong (tidak ada file README, .gitignore, dll)
    echo 3. Anda memiliki akses write ke repository
    echo 4. Git credentials sudah dikonfigurasi

    REM Remove the remote if push failed
    git remote remove origin
    pause
    exit /b 1
)

echo.
echo ==================================================
echo ✅ UPLOAD BERHASIL!
echo ==================================================
echo.

echo Repository Anda sekarang tersedia di:
echo 🔗 !REPO_URL!
echo.
echo Langkah selanjutnya:
echo 1. Buka repository di GitHub
echo 2. Buka Settings ^> General
echo 3. Centang 'Template repository' untuk menjadikannya template
echo 4. Setup GitHub Pages jika diperlukan
echo.
echo Template JavaScript + Yarn siap digunakan! 🎉
echo.
pause
