@echo off
setlocal
cd %~dp0

set ARCH=x64
set SCRIPT_DIR=%CD%
set OPENBLAS_ROOT=%SCRIPT_DIR%\..\openblas

goto :main

:echo_y
    echo [93m%*[0m
goto :eof

:echo_r
    echo [91m%*[0m
goto :eof

:main
    rem enable MSVC
    call :echo_y Environment initialized for: '%ARCH%'
    call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" %ARCH%

    rem create openblas folder
    rmdir /s /q build\openblas openblas
    mkdir build\openblas

    pushd build\openblas
        call cmake %OPENBLAS_ROOT% -G "Ninja" ^
            -DCMAKE_C_COMPILER="clang-cl"     ^
            -DNOFORTRAN="ON"                  ^
            -DCMAKE_BUILD_TYPE="Release"      ^
            -DCMAKE_INSTALL_PREFIX="%SCRIPT_DIR%\openblas"

        call cmake --build . --config Release --target install
    popd

goto :eof
