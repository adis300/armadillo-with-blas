@echo off
setlocal
cd %~dp0

set ARCH=x64
set SCRIPT_DIR=%CD%
set ARMADILLO_ROOT=%SCRIPT_DIR%\..\armadillo

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

    rem create armadillo folder
    rmdir /s /q build\armadillo armadillo
    mkdir build\armadillo

    pushd build\armadillo
        call cmake %ARMADILLO_ROOT% -A %ARCH% ^
            -DCMAKE_C_COMPILER="clang-cl"     ^
            -DCMAKE_BUILD_TYPE="Release"      ^
            -DCMAKE_INSTALL_PREFIX="%SCRIPT_DIR%\armadillo"

        call cmake --build . --config Release --target install
    popd

goto :eof