@ECHO OFF
rem ********************************
rem *****  HASH MATCH CHECKER  *****
rem ***** By Rich98            *****
Rem ********************************

rem get the hash and set the varible for file1

set "HHFILE1=" & for /F "skip=1 delims=" %%H in ('
    2^> nul CertUtil -hashfile "<add path and filename>" SHA256
') do if not defined HFILE1 set "HFILE1=%%H"


rem get the has and set the varible for file 2

set "HFILE2=" & for /F "skip=1 delims=" %%H in ('
    2^> nul CertUtil -hashfile "<add path and filename>" SHA256
') do if not defined HFILE2 set "HFILE2=%%H"

rem /* compare the hashes; regard that you need surrounding `%%` to read variables;

if "%HFILE1%%HFILE2%"=="" (
    >&2 echo ERROR: no hashes available!
) else (
    if "%HFILE1%"=="%HFILE2%" (
        echo INFO:  hashes match.
    ) else (
        if "%HFILE1%%HFILE2%"=="%HFILE2%%HFILE1%" (
            >&2 echo ERROR: one hash is missing!
        ) else (
            >&2 echo ERROR: hashes differ!
        )
    )
)
echo %HFILE1%
echo %HFILE2%
pause
