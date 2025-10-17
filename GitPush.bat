@echo off
title Git Commit & Push
cd /d "%~dp0"

REM --- Stage all files ---
git add .

REM --- Get commit message ---
SET /P msg="Enter commit message: "

REM --- Commit changes ---
git commit -m "%msg%"

REM --- Push to main branch ---
git push origin main

echo.
echo Done.
pause
