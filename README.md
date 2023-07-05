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

Windows binaries were compiled with Visual Studio Community. In addition to
Godot's built-in crash handler, you can use Visual Studio or WinDbg to get
backtraces. If you're on Windows 10, you may want to use the newer [WinDbg
Preview](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/debugger-download-tools).

See [BUILD.md](BUILD.md) if you want to compile your own debug builds easily.

<details>
<summary>Compiler versions used</summary>

### Windows

- For Godot 4.0 and later, Windows binaries were compiled on Windows 11 with Visual Studio 2022.
- For Godot 3.5.1 and older, Windows binaries were compiled on Windows 10 with Visual Studio 2019.

### Linux

- For Godot 3.5 and later, Linux binaries were compiled on Ubuntu 20.04 with GCC 9.3.
- For Godot 3.4.5 and older, Linux binaries were compiled on Ubuntu 18.04 with GCC 7.5.
- For Godot 3.2.3 and older, Linux binaries were compiled on Ubuntu 16.04 with GCC 5.4.

### macOS

- For Godot 4.0.3 and later, Xcode 14.3 is used.
</details>

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

### macOS

- Follow instructions in
  [Running Godot apps on macOS](https://docs.godotengine.org/en/latest/tutorials/export/running_on_macos.html#app-is-signed-including-ad-hoc-signatures-but-not-notarized),
  as the editor isn't notarized.
- To run the editor from a terminal, `cd` to the folder containing the `.app` bundle
  then run `"Godot Debug.app/Contents/MacOS/Godot"` (with quotes).
  This will allow you to see the crash handler's output when the editor crashes.
