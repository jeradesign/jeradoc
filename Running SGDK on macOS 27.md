# Running SGDK on macOS 27

**Note:** These instructions assume you already have [Homebrew](https://brew.sh) and the [Xcode command line tools](https://developer.apple.com/documentation/xcode/command-line-tools) installed.

## Download SGDK

```bash
git clone https://github.com/Stephane-D/SGDK.git
```

## Set Up Your Environment

Add this line to your .zshrc file (or .zshenv if you use one):
```bash
export SGDK=$HOME/path/to/SGDK
```

**Note:** You'll need to refresh your settings by either running `source ~/.zshrc` or opening a new terminal window before you proceed to the next steps.

## Install Dependencies

**Note:** `sgdk-tools` includes its own `m68k-elf-gcc` (GCC 13), which conflicts with Homebrew's `m68k-elf-gcc` package (GCC 16, which breaks SGDK's sound). If you already have Homebrew's `m68k-elf-gcc` installed, run `brew uninstall m68k-elf-gcc` before this step. (If you need both, you'll have to install one or the other manually.)

```bash
brew install jeradesign/sgdk-tools/sgdk-tools openjdk blastem
```

## Symlink Two Files from the Homebrew Install

**Note:** See the **Caveats** section at the end of the brew install output for details about why this is needed.

```bash
ln -sf /opt/homebrew/opt/sgdk-tools/bin/xgmtool $SGDK/bin/xgmtool
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
```

## One Time Setup: Rebuild SGDK Libraries

```bash
cd $SGDK && make -f makelib.gen JAVA="java -Djava.awt.headless=true"
```

## Build and Run the “Hello, World!” Example

```bash
cd $SGDK/sample/basics/hello-world
make -f $SGDK/makefile.gen JAVA="java -Djava.awt.headless=true"
blastem out/release/rom.bin >/dev/null
```

Most of the other samples build and run the same way. The exceptions:
* The `linkcable`, `megawifi` and `serial` samples need optional modules enabled in `$SGDK/inc/config.h`.
* The `tmx-map` and `tmx-simple-collisions` samples fail because of Windows-style paths in their resource files. To fix, simply change the `\` characters to `/` characters in the `res/maps.res` files.
* The `bad-apple` sample builds, but won't run in BlastEm or MAME. It will run in OpenEmu, and is _definitely_ worth running.
