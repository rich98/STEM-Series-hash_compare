@echo off
setlocal enabledelayedexpansion

set "search_file1=file1.txt"
set "search_file2=file2.txt"
set "results_file=results.txt"

rem Delete the results file if it exists
if exist %results_file% del %results_file%

for %%d in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (
    if exist "%%d\" (
        echo Searching in %%d\
        call :search "%%d\" %search_file1%
        call :search "%%d\" %search_file2%
    )
)

echo Search complete. Results saved to %results_file%
pause
exit /b

:search
for /r %1 %%f in (%2) do (
    echo Found: %%f >> %results_file%
    
    rem Display only "Name" and "Version" properties using WMIC
    set "filepath=%%f"
    for /f "tokens=1,* delims==" %%p in ('wmic datafile where "name='!filepath:\=\\!'" get /format:list ^| find "="') do (
        if "%%p"=="Name" echo File Property: %%q >> %results_file%
        if "%%p"=="Version" echo File Property: %%q >> %results_file%
    )
)
exit /b
