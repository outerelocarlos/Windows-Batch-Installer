@powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\Core.ps1" -include "%~dp0..\Functions.psm1" -preset "%~dpn0.preset" -log "%~dpn0.log"
