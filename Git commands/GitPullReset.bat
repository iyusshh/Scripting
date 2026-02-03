@echo off
cd ..
git fetch --all
for /f "tokens=*" %%b in ('git symbolic-ref --short HEAD') do set BRANCH=%%b
git reset --hard origin/%BRANCH%
git clean -fd
