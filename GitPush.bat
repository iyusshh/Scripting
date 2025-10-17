@echo off
REM ######################################################################
REM # Automated Git Commit and Push Script
REM # Created to streamline the add, commit, and push process.
REM ######################################################################

REM --- Configuration and Setup ---

REM Set the title for the CMD window
title Git Automation Script

REM Ensure the script stops on error and displays the output cleanly
setlocal enabledelayedexpansion
color 1F

ECHO ===========================================
ECHO Starting Git Commit & Push Workflow
ECHO ===========================================
ECHO.

REM 1. GIT ADD
ECHO [STEP 1/4] Adding all untracked and modified files...
git add .
IF ERRORLEVEL 1 (
    ECHO ERROR: Git add failed. Check your repository status.
    GOTO :END_PAUSE
)
ECHO.

REM 2. GET COMMIT MESSAGE FROM USER
ECHO [STEP 2/4] Enter your commit message:
ECHO --------------------------------------------
SET /P commit_message="> "
ECHO --------------------------------------------
ECHO.

REM Check if the message is empty
IF NOT DEFINED commit_message (
    ECHO WARNING: Commit aborted. Commit message cannot be empty.
    GOTO :END_PAUSE
)

REM 3. GIT COMMIT
ECHO [STEP 3/4] Committing changes with message: "%commit_message%"
git commit -m "%commit_message%"
IF ERRORLEVEL 1 (
    ECHO WARNING: Git commit failed. Check if there are actual changes to commit.
    GOTO :END_PAUSE
)
ECHO.

REM --- CHECK BRANCH STATUS BEFORE PUSH ---

REM Use git status to check if the local branch is ahead of origin/main
ECHO [STEP 4/4] Checking branch status before push...
FOR /f "tokens=*" %%a IN ('git status -uno') DO (
    ECHO %%a | findstr /i "Your branch is ahead of" >nul
    IF NOT ERRORLEVEL 1 (
        SET "AHEAD_OF_ORIGIN=true"
    )
)

IF DEFINED AHEAD_OF_ORIGIN (
    ECHO Status: Local branch is ahead of origin. Pushing changes...
    ECHO --------------------------------------------
    
    REM 4. GIT PUSH
    git push origin main
    IF ERRORLEVEL 1 (
        ECHO FATAL ERROR: Git push failed! Review the output above.
        GOTO :END_PAUSE
    )
    ECHO.
    ECHO ===========================================
    ECHO SUCCESS: All changes committed and pushed to origin/main.
    ECHO ===========================================
    
) ELSE (
    ECHO Status: Nothing new to push or branch is up-to-date.
    ECHO ===========================================
    ECHO SUCCESS: Changes committed locally. No push necessary.
    ECHO ===========================================
)

REM 5. GIT STATUS (Final confirmation)
ECHO.
ECHO Final repository status:
git status

GOTO :END_PAUSE

:END_PAUSE
ECHO.
ECHO Press any key to close this window...
PAUSE >nul
