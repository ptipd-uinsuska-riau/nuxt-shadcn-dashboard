@echo off
setlocal enabledelayedexpansion

REM ==============================================
REM NUXT SHADCN STARTER TEMPLATE - SETUP SCRIPT (Windows)
REM ==============================================
REM This script helps you set up the project quickly on Windows

echo.
echo ==================================================
echo 🚀 NUXT SHADCN STARTER TEMPLATE SETUP
echo ==================================================
echo.

REM Check Node.js
echo [INFO] Checking Node.js version...
node --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Node.js is not installed. Please install Node.js 18+ from https://nodejs.org/
    pause
    exit /b 1
) else (
    for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
    echo [SUCCESS] Node.js found: !NODE_VERSION!
)

REM Use Yarn as the preferred package manager
echo [INFO] Using Yarn as package manager...
set PACKAGE_MANAGER=yarn

REM Check if Yarn is installed
yarn --version >nul 2>&1
if errorlevel 1 (
    echo [WARNING] Yarn is not installed. Installing Yarn...
    npm install -g yarn
    if errorlevel 1 (
        echo [ERROR] Failed to install Yarn. Falling back to npm.
        set PACKAGE_MANAGER=npm
    ) else (
        echo [SUCCESS] Yarn installed successfully!
    )
)

echo [SUCCESS] Using package manager: !PACKAGE_MANAGER!

REM Install dependencies
echo [INFO] Installing dependencies...
if "!PACKAGE_MANAGER!"=="yarn" (
    yarn install
) else (
    npm install
)

echo [SUCCESS] Dependencies installed successfully!

REM Setup environment file
echo [INFO] Setting up environment file...
if not exist ".env" (
    copy ".env.example" ".env" >nul
    echo [SUCCESS] Created .env file from .env.example
    echo [WARNING] Please edit .env file with your actual configuration values
) else (
    echo [WARNING] .env file already exists. Skipping...
)

REM Git initialization
if not exist ".git" (
    echo [INFO] Initializing Git repository...
    git init >nul 2>&1
    if errorlevel 1 (
        echo [WARNING] Git is not installed or not in PATH. Skipping Git initialization...
    ) else (
        git add . >nul
        git commit -m "🎉 Initial commit: Nuxt ShadCN Starter Template" >nul
        echo [SUCCESS] Git repository initialized with initial commit
    )
) else (
    echo [WARNING] Git repository already exists. Skipping initialization...
)

REM Final instructions
echo.
echo ==================================================
echo ✅ SETUP COMPLETED SUCCESSFULLY!
echo ==================================================
echo.

echo Next steps:
echo 1. Edit .env file with your configuration
echo 2. Run 'yarn dev' to start development server
echo 3. Open http://localhost:3000 in your browser
echo.
echo Available commands:
echo   yarn dev         - Start development server
echo   yarn build       - Build for production
echo   yarn preview     - Preview production build
echo   yarn lint        - Run ESLint
echo   yarn format      - Format code with ESLint
echo   yarn clean       - Clean build artifacts
echo   yarn update-deps - Update dependencies
echo.
echo Happy coding! 🎉
echo.
pause
