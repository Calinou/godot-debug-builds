# Godot debug builds

This repository contains *debug* builds of the Godot editor with full debugging
information. Most optimizations are disabled to make backtraces more useful.
You want to use an [optimized build](https://godotengine.org/download/) for
production, as it'll feel significantly snappier.

Those binaries can also be used to
[profile the engine execution](https://docs.godotengine.org/en/stable/development/cpp/using_cpp_profilers.html)
and see where performance bottlenecks (in debug mode) come from. Note that in release
binaries, the bottlenecks may not be exactly the same as release binaries have
more optimizations enabled.

Windows binaries were compiled with Visual Studio Community 2019 (version
16.4.3). In addition to Godot's built-in crash handler, you can use Visual
Studio or WinDbg to get backtraces. If you're on Windows 10, you may want to use
the newer
[WinDbg Preview](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/debugger-download-tools).

For Godot 3.3 and later, Linux binaries were compiled on Ubuntu 18.04 with GCC 7.5.
For Godot 3.2.3 and older, Linux binaries were compiled on Ubuntu 16.04 with GCC 5.4.

See [BUILD.md](BUILD.md) if you want to compile your own debug builds easily.

## Downloads

- **Head to the [Releases](https://github.com/Calinou/godot-debug-builds/releases)
  tab of this repository for downloads.**

## Usage

### Windows

- Download a debug build and extract the ZIP archive.
  - Make sure the PDB file is next to the executable at all times! The PDB file
    must also have the same name as the executable to work.
- Start the debug build. You can either start it from a debugger, or attach a
  debugger at runtime (if you use Visual Studio for debugging).

### Linux

- Download a debug build and extract the ZIP archive.
- Start the debug build from a terminal. You should get a backtrace in
  the terminal when it crashes.
  - You can also use `gdb` or `lldb` from the command line to run Godot and
    get a backtrace using `bt full`.
