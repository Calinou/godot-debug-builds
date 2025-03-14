#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "${BASH_SOURCE[0]}")"

rm -rf /tmp/godot
git clone --branch="4.4-stable" --depth=1 https://github.com/godotengine/godot.git /tmp/godot

pushd /tmp/godot

for arch in "arm64" "x86_64"; do
    scons platform=macos debug_symbols=yes progress=no optimize=speed_trace target=editor arch=$arch -j$(sysctl -n hw.logicalcpu)
    scons platform=macos debug_symbols=yes progress=no optimize=speed_trace target=template_debug arch=$arch -j$(sysctl -n hw.logicalcpu)
    scons platform=macos debug_symbols=yes progress=no optimize=speed_trace target=template_release arch=$arch -j$(sysctl -n hw.logicalcpu)
done

# Create universal binaries.
lipo -create bin/godot.macos.editor.x86_64 bin/godot.macos.editor.arm64 -output bin/godot.macos.editor.universal
rm -f bin/godot.macos.editor.x86_64 bin/godot.macos.editor.arm64
lipo -create bin/godot.macos.template_debug.x86_64 bin/godot.macos.template_debug.arm64 -output bin/godot.macos.template_debug.universal
rm -f bin/godot.macos.template_debug.x86_64 bin/godot.macos.template_debug.arm64
lipo -create bin/godot.macos.template_release.x86_64 bin/godot.macos.template_release.arm64 -output bin/godot.macos.template_release.universal
rm -f bin/godot.macos.template_release.x86_64 bin/godot.macos.template_release.arm64

# Create editor .app bundle and self-sign it, so it can run after bypassing the warning.
cp -r misc/dist/macos_tools.app/ "bin/Godot Debug.app"
mkdir -p "bin/Godot Debug.app/Contents/MacOS/"
mv bin/godot.macos.editor.universal "bin/Godot Debug.app/Contents/MacOS/Godot"
chmod +x "bin/Godot Debug.app/Contents/MacOS/Godot"
codesign -s - --force --deep "bin/Godot Debug.app"

# Create export template .app bundle and self-sign it, so it can run after bypassing the warning.
cp -r misc/dist/macos_template.app/ bin/macos_template.app
mkdir -p bin/macos_template.app/Contents/MacOS/
mv bin/godot.macos.template_debug.universal bin/macos_template.app/Contents/MacOS/godot_macos_debug.universal
mv bin/godot.macos.template_release.universal bin/macos_template.app/Contents/MacOS/godot_macos_release.universal
chmod +x bin/macos_template.app/Contents/MacOS/godot_macos_debug.universal
chmod +x bin/macos_template.app/Contents/MacOS/godot_macos_release.universal
codesign -s - --force --deep bin/macos_template.app

ls -l bin/*

popd

mv /tmp/godot/bin/* bin/macos/
ls -l bin/macos
