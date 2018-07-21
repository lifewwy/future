

echo off
tasklist /fi "imagename eq MATLAB.exe" |find ":" > nul
if errorlevel 1 taskkill /f /im "MATLAB.exe" 
start "" "C:\Program Files\MATLAB\R2015a\bin\matlab.exe" -nosplash -r "run('C:\D\xyz\future\AutoRun\Main_AutoRun.m')"


