@echo off
cd /d "%~dp0"
where code >nul 2>&1
if errorlevel 1 (
  echo The "code" command was not found.
  echo Open VS Code, then use File ^> Open Folder and choose this folder.
  pause
  exit /b 1
)
code .
