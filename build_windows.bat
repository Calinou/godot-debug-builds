@echo off

:: Clean up old build directly in casse the previous build was aborted.
rmdir /s /q %TEMP%\godot-debug-build

git clone --branch="3.4-stable" --depth=1 https://github.com/godotengine/godot.git %TEMP%\godot-debug-build
pushd %TEMP%\godot-debug-build
:: scons -j%NUMBER_OF_PROCESSORS% debug_symbols=yes progress=no
:: scons -j%NUMBER_OF_PROCESSORS% debug_symbols=yes progress=no tools=no
scons -j%NUMBER_OF_PROCESSORS% debug_symbols=yes progress=no tools=no target=release
popd

:: Create the destination directory in case it doesn't exist yet.
:: This may be required when this script is copied to another location
:: (e.g. to run successfully on a network-mapped drive).
mkdir bin
mkdir bin\windows
move %TEMP%\godot-debug-build\bin\*.exe bin\windows
rmdir /s /q %TEMP%\godot-debug-build
