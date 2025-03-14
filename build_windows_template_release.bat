@echo off

:: Clean up old build directly in case the previous build was aborted.
rmdir /s /q %TEMP%\godot-debug-build-template-release

git clone --branch="4.4-stable" --depth=1 https://github.com/godotengine/godot.git %TEMP%\godot-debug-build-template-release
pushd %TEMP%\godot-debug-build-template-release
scons debug_symbols=yes progress=no optimize=speed_trace target=template_release
popd

:: Create the destination directory in case it doesn't exist yet.
:: This may be required when this script is copied to another location
:: (e.g. to run successfully on a network-mapped drive).
mkdir bin
mkdir bin\windows
move %TEMP%\godot-debug-build-template-release\bin\*.exe bin\windows
move %TEMP%\godot-debug-build-template-release\bin\*.pdb bin\windows
rmdir /s /q %TEMP%\godot-debug-build-template-release
