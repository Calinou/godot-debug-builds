# Build instructions

## Windows

- Install Visual Studio 2019.
- Run `build_windows.bat` by double-clicking it.

## Linux

- Install Docker or Podman.
- Clone this repository, use `cd` to reach it from a terminal and run
  `./build_linux.sh`.

## Final steps

After building for both Windows and Linux (see above), you can compress the
binaries to optimize their distribution. Install parallel from your
distribution's package manager then run `./compress.sh`.
