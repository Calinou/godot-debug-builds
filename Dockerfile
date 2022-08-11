# This Dockerfile only installs dependencies for compiling Godot.
# See `build_linux.sh` for the actual build commands.
FROM ubuntu:20.04

# Set timezone programmatically so building isn't interrupted by tzdata asking
# for a timezone.
ENV TZ=Europe/Paris

RUN \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get update -qq && \
    apt-get install -yqq \
        git build-essential scons pkg-config libx11-dev libxcursor-dev \
        libxinerama-dev libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev \
        libudev-dev libxi-dev libxrandr-dev yasm
