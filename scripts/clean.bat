@echo off
setlocal enabledelayedexpansion

REM ==============================================
REM CLEANUP SCRIPT - Nuxt ShadCN Starter Template (Windows)
REM ==============================================
REM This script cleans up build artifacts and cache files

echo.
echo ==================================================
echo 🧹 CLEANUP SCRIPT
echo ==================================================
echo.

REM Function to remove directory if it exists
:remove_dir
if exist "%1" (
    echo [INFO] Removing %1...
    rmdir /s /q "%1" 2>nul
    echo [SUCCESS] Removed %1
) else (
    echo [WARNING] %1 does not exist, skipping...
)
goto :eof

REM Function to remove file if it exists
:remove_file
if exist "%1" (
    echo [INFO] Removing %1...
    del /q "%1" 2>nul
    echo [SUCCESS] Removed %1
) else (
    echo [WARNING] %1 does not exist, skipping...
)
goto :eof

REM Clean Nuxt build artifacts
echo [INFO] Cleaning Nuxt build artifacts...
call :remove_dir ".nuxt"
call :remove_dir ".output"
call :remove_dir "dist"
call :remove_dir ".nitro"

REM Clean cache directories
echo [INFO] Cleaning cache directories...
call :remove_dir ".cache"
call :remove_dir "node_modules\.cache"
call :remove_file ".eslintcache"

REM Clean temporary files
echo [INFO] Cleaning temporary files...
call :remove_dir "tmp"
call :remove_dir "temp"

REM Clean log files
echo [INFO] Cleaning log files...
call :remove_file "npm-debug.log"
call :remove_file "yarn-debug.log"
call :remove_file "yarn-error.log"
for /r %%i in (*.log) do del /q "%%i" 2>nul

REM Clean OS specific files
echo [INFO] Cleaning OS specific files...
for /r %%i in (Thumbs.db) do del /q "%%i" 2>nul
for /r %%i in (Desktop.ini) do del /q "%%i" 2>nul

REM Clean editor files
echo [INFO] Cleaning editor temporary files...
for /r %%i in (*.swp) do del /q "%%i" 2>nul
for /r %%i in (*.swo) do del /q "%%i" 2>nul

REM Option to clean node_modules
if "%1"=="--all" goto clean_all
if "%1"=="-a" goto clean_all
goto end_clean

:clean_all
echo [WARNING] Removing node_modules (this will require reinstalling dependencies)...
call :remove_dir "node_modules"
call :remove_file "package-lock.json"
call :remove_file "yarn.lock"
call :remove_file "pnpm-lock.yaml"

:end_clean
echo.
echo ==================================================
echo ✅ CLEANUP COMPLETED!
echo ==================================================
echo.

if "%1"=="--all" goto show_all_message
if "%1"=="-a" goto show_all_message
echo Run with --all or -a flag to also remove node_modules and lock files
goto end

:show_all_message
echo Next steps:
echo 1. Run 'npm install' to reinstall dependencies
echo 2. Run 'npm run dev' to start development server

:end
pause
