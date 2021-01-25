# Build scripts

These one-line build scripts can be pasted in fresh containers or VMs to compile Godot debug builds.

Replace `3.2.3-stable` with the desired Git tag.

**Tip:** Triple-click a line to select it in its entirety, then press
<kbd>Ctrl + C</kbd> to copy it.

## Windows

- Install Visual Studio 2019.
- Open a standard command prompt (`cmd.exe`, not PowerShell) and run:

```batch
git clone --branch="3.2.3-stable" --depth=1 https://github.com/godotengine/godot.git "C:\godot" && cd "C:\godot" && scons -j%NUMBER_OF_PROCESSORS% progress=no && scons -j%NUMBER_OF_PROCESSORS% progress=no tools=no target=release_debug && scons -j%NUMBER_OF_PROCESSORS% progress=no tools=no target=release
```

To compress all binaries in efficient (but compatible) ZIP archives, install
`parallel` from your distribution's package manager then run the following
command in the resulting `bin/` folder:

```bash
parallel 7z a -mx9 {}.zip {.}.exe {.}.pdb ::: *.exe
```

## Linux

- Install Docker or Podman.
- Open a terminal and run `docker run -it ubuntu:16.04`.
- In the container, run:

```bash
apt update -qq && apt install -yqq git build-essential scons pkg-config libx11-dev libxcursor-dev libxinerama-dev libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libudev-dev libxi-dev libxrandr-dev yasm && git clone --branch="3.2.3-stable" --depth=1 https://github.com/godotengine/godot.git /opt/godot && cd /opt/godot && scons -j$(nproc) progress=no && scons -j$(nproc) progress=no tools=no && scons -j$(nproc) progress=no tools=no target=release && scons platform=server -j$(nproc) progress=no && scons platform=server -j$(nproc) progress=no tools=no && scons platform=server -j$(nproc) progress=no tools=no target=release
```

- Once the build is completed, leave the container open. Open a second terminal and run `docker cp <name>:/opt/godot/bin .` where `<name>` is the name of the container.
  - Use `docker container ls` to find out the container's name.
  - The binaries will be placed in a `bin/` folder in your current working directory.

To compress all binaries in efficient (but compatible) ZIP archives, install
`parallel` from your distribution's package manager then run the following
command in the resulting `bin/` folder:

```bash
parallel 7z a -mx9 {}.zip {} ::: *
```
