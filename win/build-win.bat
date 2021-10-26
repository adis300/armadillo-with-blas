@echo off
setlocal
cd %~dp0

call build-openblas.bat

call build-armadillo.bat