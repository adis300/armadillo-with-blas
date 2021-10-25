set ARMADILLO_VERSION=10.7.1
set OPENBLAS_VERSION=0.3.18
set LAPACK_VERSION=3.10.0

set ARMADILLO_PACK="armadillo-%ARMADILLO_VERSION%.tar"
set LAPACK_PACK="LAPACK-%LAPACK_VERSION%.zip"
set OPENBLAS_PACK="openblas-%OPENBLAS_VERSION%.zip"

set ARMADILLO_URL="http://sourceforge.net/projects/arma/files/%ARMADILLO_PACK%.xz"
set OPENBLAS_URL="https://github.com/xianyi/OpenBLAS/releases/download/v0.3.18/OpenBLAS-%OPENBLAS_VERSION%.zip"
set LAPACK_URL="https://github.com/Reference-LAPACK/lapack/archive/refs/tags/v%LAPACK_VERSION%.zip"

if NOT EXIST deps (
    MKDIR deps
)

cd deps

:: Install armadillo to deps
if NOT EXIST %ARMADILLO_PACK% (
    echo Downloading %ARMADILLO_PACK%
    wget %ARMADILLO_URL%
    call 7z x %ARMADILLO_PACK%.xz
)
:: Install OpenBLAS to deps
if NOT EXIST %OPENBLAS_PACK% (
    echo Downloading %OPENBLAS_URL%
    wget %OPENBLAS_URL% -O %OPENBLAS_PACK%
)

:: Install LAPACK to deps
if NOT EXIST %LAPACK_PACK% (
    echo Downloading %LAPACK_URL%
    wget %LAPACK_URL% -O %LAPACK_PACK%
)

cd ..

if exist armadillo (
    echo Armadillo package is already unpacked
) else (
    call tar xf "deps\\%ARMADILLO_PACK%"
    REN armadillo-%ARMADILLO_VERSION% armadillo
)

if exist openblas (
    echo OpenBLAS is already unpacked
) else (
    call 7z x "deps\%OPENBLAS_PACK%"
    REN OpenBLAS-%OPENBLAS_VERSION% openblas
)

if exist lapack (
    echo LAPACK is already unpacked
) else (
    call 7z x "deps\%LAPACK_PACK%"
    REN lapack-%LAPACK_VERSION% lapack
)



