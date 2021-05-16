# This Dockerfile only installs dependencies for compiling Godot.
# See `build_linux.sh` for the actual build commands.
FROM ubuntu:18.04

RUN \
    apt-get update -qq && \
    apt-get install -yqq \
        git build-essential scons pkg-config libx11-dev libxcursor-dev \
        libxinerama-dev libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev \
        libudev-dev libxi-dev libxrandr-dev yasm
