@echo off
setlocal
cd /d %~dp0

where pwsh >nul 2>&1
if %errorlevel% equ 0 (
    pwsh.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0speedtest.ps1" %*
) else (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0speedtest.ps1" %*
)
