@echo off
setlocal enabledelayedexpansion

set "search_file1=java.txt"
set "search_file2=javaw.exe"
set "results_file=results.txt"

rem Delete the results file if it exists
if exist %results_file% del %results_file%

@echo off

rem for %%d in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (
for %%d in (A: B: C: D:) do (

    if exist "%%d\" (
        echo Searching in %%d\
        call :search "%%d\" %search_file1%
        call :search "%%d\" %search_file2%
    )
)

echo Search complete. Results saved to %results_file%
pause
exit /b

@echo off

:search
for /r %1 %%f in (%2) do (
    echo Found: %%f >> %results_file%
    
    rem Display file properties using WMIC
    set "filepath=%%f"
    for /f "delims=" %%p in ('wmic datafile where "name='!filepath:\=\\!'" get /format:list ^| find "="') do (
        echo File Property: %%p >> %results_file%
    )
)
exit /b
