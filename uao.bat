@echo off

setlocal

REM Check if all required arguments are provided
if "%~1"=="" (
    echo Usage: %0 ^<zip_file^>
    exit /b 1
)

REM Set input variables
set "zip_file_path=%~1"
set "extract_folder_path={{fill-in-full-output-folder-path}}"

REM Extract the archive name from the path
for %%I in ("%zip_file_path%") do set "archive_name=%%~nI"

REM Static IntelliJ IDEA executable path
set "idea_executable_path={{fill-in-full-path.exe}}"

REM Unpack the zip folder
if not exist "%extract_folder_path%" (
	mkdir "%extract_folder_path%"
)

powershell -command "Expand-Archive -Path '%zip_file_path%' -DestinationPath '%extract_folder_path%'"

REM Open the unpacked folder with IntelliJ IDEA
start "" "%idea_executable_path%" "%extract_folder_path%\%archive_name%"

endlocal
