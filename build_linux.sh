#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "${BASH_SOURCE[0]}")"

# See `Dockerfile` for the dependency installation.
docker build -t godot-debug-builder .
# `:z` suffix to volume path is required to fix permissions on host systems with SELinux enabled.
docker run --rm --volume "$PWD/bin/linux":/opt/artifacts:z godot-debug-builder sh -c '
git clone --branch="4.0-stable" --depth=1 https://github.com/godotengine/godot.git /opt/godot/
cd /opt/godot/
scons platform=linuxbsd debug_symbols=yes progress=no optimize=speed_trace target=editor
scons platform=linuxbsd debug_symbols=yes progress=no optimize=speed_trace target=template_debug
scons platform=linuxbsd debug_symbols=yes progress=no optimize=speed_trace target=template_release
mv bin/* /opt/artifacts/
ls -l /opt/artifacts/
'
