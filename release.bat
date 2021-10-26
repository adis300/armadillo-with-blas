rmdir /s /q release

call unpack-deps.bat

cd win
call build-win.bat
cd ..

mkdir -p release\win\include release\include

xcopy /E win\openblas\include\openblas release\win\include
xcopy win\openblas\lib\*.lib release\win

xcopy /E win\armadillo\include release\win\include
xcopy win\armadillo\lib\*.lib release\win

xcopy /E release\win\include release\include