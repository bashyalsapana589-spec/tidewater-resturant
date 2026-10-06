@echo off
title Tidewater Kitchen
cd /d "%~dp0"
docker info >nul 2>&1
if errorlevel 1 (
  echo Docker Desktop is not running. Start it, wait until it says "running", then double-click RUN.bat again.
  pause
  exit /b 1
)
echo Building and starting containers. The first run takes a few minutes...
docker compose up --build -d
if errorlevel 1 (
  echo.
  echo Docker Compose failed. Read the error above.
  pause
  exit /b 1
)
echo.
docker compose ps
timeout /t 4 >nul
start http://localhost:8080
echo.
echo Website: http://localhost:8080
echo To stop everything, double-click STOP.bat
pause
