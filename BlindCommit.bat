@echo off
git add . >nul 2>&1
git commit --allow-empty-message -m "" >nul 2>&1
git push origin main >nul 2>&1
exit
