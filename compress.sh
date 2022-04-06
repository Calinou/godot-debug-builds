#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "${BASH_SOURCE[0]}")"

# This script should be run after running both `build_linux.sh` and `build_windows.bat`.

GODOT_VERSION="3.4.4"

parallel 7z a -mx9 "{}.zip" "{}" ::: bin/linux/*.64

mv bin/linux/{godot.x11.tools.64.zip,godot-$GODOT_VERSION-editor-debug-linux-gcc7.5.zip}
mv bin/linux/{godot.x11.debug.64.zip,godot-$GODOT_VERSION-debug-template-linux-gcc7.5.zip}
mv bin/linux/{godot.x11.opt.64.zip,godot-$GODOT_VERSION-release-template-linux-gcc7.5.zip}
mv bin/linux/{godot_server.x11.tools.64.zip,godot-server-$GODOT_VERSION-editor-debug-linux-gcc7.5.zip}
mv bin/linux/{godot_server.x11.debug.64.zip,godot-server-$GODOT_VERSION-debug-template-linux-gcc7.5.zip}
mv bin/linux/{godot_server.x11.opt.64.zip,godot-server-$GODOT_VERSION-release-template-linux-gcc7.5.zip}

rm bin/linux/*.64

parallel 7z a -mx9 "{.}.zip" "{.}.exe" "{.}.pdb" ::: bin/windows/*.exe

mv bin/windows/{godot.windows.tools.64.zip,godot-$GODOT_VERSION-editor-debug-windows-msvc2019.zip}
mv bin/windows/{godot.windows.debug.64.zip,godot-$GODOT_VERSION-debug-template-windows-msvc2019.zip}
mv bin/windows/{godot.windows.opt.64.zip,godot-$GODOT_VERSION-release-template-windows-msvc2019.zip}

rm bin/windows/*.{exe,pdb}
