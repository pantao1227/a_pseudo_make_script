@echo off

:: tex 一系列的工具要求 utf-8 环境
chcp 65001 > nul

set arg1=%1

if "%arg1%"=="compile" (
    goto compile
) else (
    goto not_compile
)

:not_compile
if "%arg1%"=="clean" (
    goto clean
) else (
    goto not_compile_or_clean
)
goto EOF

:not_compile_or_clean
if "%arg1%"=="" (
    goto compile
) else (
    goto err
)
goto EOF

:compile
texify.exe --pdf --engine=xetex --synctex=1 --clean Alienation_of_ST_and_its_reflection.tex
goto EOF

:clean
del *.log *.pdf *.gz
goto EOF

:err
echo syntax error.
goto EOF

:EOF
