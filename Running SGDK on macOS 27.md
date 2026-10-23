#  Running SGDK on macOS 27
**Note:** These instructions assume you already have [Homebrew](https://brew.sh) and the [Xcode command line tools](https://developer.apple.com/documentation/xcode/command-line-tools) installed.
## Set Up Your Environment
Add this line to your .zshrc file (or .zshenv if you use one):
```bash
export SGDK=path/to/SGDK
```
## Install Dependencies
```bash
brew install m68k-elf-gcc openjdk blastem
```
## One Time Setup: Rebuild SGDK Libraries
```bash
cd $SGDK
make -f makelib.gen clean-release clean-debug release
```
## Build and Run the “Hello, World!” Example
```bash
cd sample/basics/hello-world
make -f $SGDK/makefile.gen
blastem out/release/rom.bin >/dev/null
```
