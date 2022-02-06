#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "${BASH_SOURCE[0]}")"

# See `Dockerfile` for the dependency installation.
docker build -t godot-debug-builder .
docker run --rm --volume "$PWD/bin/linux":/opt/artifacts godot-debug-builder sh -c '
git clone --branch="3.4.2-stable" --depth=1 https://github.com/godotengine/godot.git /opt/godot/
cd /opt/godot/
scons platform=x11 -j$(nproc) debug_symbols=yes progress=no
scons platform=x11 -j$(nproc) debug_symbols=yes progress=no tools=no
scons platform=x11 -j$(nproc) debug_symbols=yes progress=no tools=no target=release
scons platform=server -j$(nproc) debug_symbols=yes progress=no
scons platform=server -j$(nproc) debug_symbols=yes progress=no tools=no
scons platform=server -j$(nproc) debug_symbols=yes progress=no tools=no target=release
mv bin/* /opt/artifacts/
ls -l /opt/artifacts/
'
