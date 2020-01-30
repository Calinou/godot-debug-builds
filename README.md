# Godot debug builds

This repository contains *debug* builds of the Godot editor with full debugging
information. Most optimizations are disabled to make backtraces more useful.
You want to use an [optimized build](https://godotengine.org/download/) for
production, as it'll feel significantly snappier.

Windows binaries were compiled with Visual Studio Community 2019 (version 16.4.3).
You can use Visual Studio or WinDbg to get backtraces. If you're on Windows 10, you may want to use
the newer [WinDbg Preview](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/debugger-download-tools).

## Downloads

- Head to the [Releases](/releases/latest) tab of this repository for downloads.

## Usage

- Download a debug build and extract the ZIP archive.
  - Make sure the PDB file is next to the executable at all times! The PDB file
    must also have the same name as the executable to work.
- Start the debug build. You can either start it from a debugger, or attach a
  debugger at runtime (if you use Visual Studio for debugging).
