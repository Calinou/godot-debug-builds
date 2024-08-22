#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "${BASH_SOURCE[0]}")"

# This script should be run after running both `build_linux.sh` and `build_windows.bat`.

GODOT_VERSION="4.2.2"

# Run this `parallel` command in parallel with the one below.
parallel 7z a -mx9 "{}.zip" "{}" ::: {bin/linux/*.x86_64,bin/macos/*.app}

# Each ZIP should contain both console and non-console executables, as the console executable
# depends on the non-console executable's presence to work.
parallel 7z a -mx9 "{.}.zip" "{.}.exe" "{.}.pdb" "{.}.console.exe" "{.}.console.pdb" ::: bin/windows/*.x86_64.exe

mv bin/linux/{godot.linuxbsd.editor.x86_64.zip,godot-$GODOT_VERSION-editor-debug-linux-gcc9.3.zip}
mv bin/linux/{godot.linuxbsd.template_debug.x86_64.zip,godot-$GODOT_VERSION-debug-template-linux-gcc9.3.zip}
mv bin/linux/{godot.linuxbsd.template_release.x86_64.zip,godot-$GODOT_VERSION-release-template-linux-gcc9.3.zip}

rm bin/linux/*.x86_64

mv bin/macos/{"Godot Debug.app.zip",godot-$GODOT_VERSION-editor-debug-macos-universal.zip}
mv bin/macos/{"macos_template.app.zip",godot-$GODOT_VERSION-templates-macos-universal.zip}

rm -rf bin/macos/*.app

mv bin/windows/{godot.windows.editor.x86_64.zip,godot-$GODOT_VERSION-editor-debug-windows-msvc2022.zip}
mv bin/windows/{godot.windows.template_debug.x86_64.zip,godot-$GODOT_VERSION-debug-template-windows-msvc2022.zip}
mv bin/windows/{godot.windows.template_release.x86_64.zip,godot-$GODOT_VERSION-release-template-windows-msvc2022.zip}

rm bin/windows/*.{exe,pdb}
