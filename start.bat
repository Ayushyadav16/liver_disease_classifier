@echo off
setlocal enabledelayedexpansion

REM Change to script directory
cd /d "%~dp0"

REM Create venv if missing
if not exist .venv (
    python -m venv .venv
)

REM Upgrade build tools and install deps
call .\.venv\Scripts\python.exe -m ensurepip --upgrade
call .\.venv\Scripts\python.exe -m pip install --upgrade pip setuptools wheel
call .\.venv\Scripts\python.exe -m pip install -r requirements.txt

REM Re-train model to ensure compatibility with current sklearn
call .\.venv\Scripts\python.exe Liver.py

REM Start the Flask app
call .\.venv\Scripts\python.exe app.py

endlocal

