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

REM Detect package manager
echo [INFO] Detecting package manager...
if exist "yarn.lock" (
    set PACKAGE_MANAGER=yarn
) else if exist "pnpm-lock.yaml" (
    set PACKAGE_MANAGER=pnpm
) else if exist "package-lock.json" (
    set PACKAGE_MANAGER=npm
) else (
    set PACKAGE_MANAGER=npm
)

echo [SUCCESS] Using package manager: !PACKAGE_MANAGER!

REM Install dependencies
echo [INFO] Installing dependencies...
if "!PACKAGE_MANAGER!"=="yarn" (
    yarn --version >nul 2>&1
    if errorlevel 1 (
        echo [ERROR] Yarn is not installed. Installing with npm instead...
        npm install
    ) else (
        yarn install
    )
) else if "!PACKAGE_MANAGER!"=="pnpm" (
    pnpm --version >nul 2>&1
    if errorlevel 1 (
        echo [ERROR] PNPM is not installed. Installing with npm instead...
        npm install
    ) else (
        pnpm install
    )
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
echo 2. Run 'npm run dev' (or 'yarn dev'/'pnpm dev') to start development server
echo 3. Open http://localhost:3000 in your browser
echo.
echo Available commands:
echo   npm run dev      - Start development server
echo   npm run build    - Build for production
echo   npm run preview  - Preview production build
echo   npm run lint     - Run ESLint
echo   npm run format   - Format code with ESLint
echo.
echo Happy coding! 🎉
echo.
pause
