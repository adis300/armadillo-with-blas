set ARMADILLO_VERSION=10.7.1
set PACK="armadillo-%ARMADILLO_VERSION%.zip"
if exist armadillo (
    echo Armadillo package is already unpacked
) else (
    call 7z x %PACK% -oarmadillo
)