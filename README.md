# apkzhi — Custom Android APK Builder for Termux

A customized fork of the upstream apkgen-cli project. Project templates and build routines are retained and adapted for the `apkzhi` command. See `LICENSE` for the upstream license and preserve it when redistributing.

## Install from your GitHub repository

After uploading this repository to your own GitHub repository, run (replace `YOUR-USERNAME/YOUR-REPO`):

```bash
pkg update -y
pkg install -y git bash coreutils findutils sed grep gum openjdk-17
termux-setup-storage
git clone https://github.com/YOUR-USERNAME/YOUR-REPO.git
cd YOUR-REPO
bash install.sh
```

Then run `apkzhi`. Projects created from the interactive menu are placed in `/storage/emulated/0/apkbuilder/`.

## Commands

```bash
apkzhi                         # interactive menu
apkzhi create MyApp            # Java project
apkzhi create MyApp --kotlin   # Kotlin project
apkzhi create MyFlutter --flutter
apkzhi create MyNative --nativec
apkzhi create MyNativeCpp --nativecpp
cd /storage/emulated/0/apkbuilder/MyApp && apkzhi build debug
apkzhi help
```

## Requirements and limits

- Android SDK/Gradle configuration is required for Android APK builds. The project wrapper and template must be compatible with your Termux environment.
- Flutter projects require Flutter SDK and its Android toolchain.
- Native C/C++ templates require Android NDK/CMake configured by the template.
- `apkzhi` does not bypass toolchain or dependency errors; read the build output for diagnostics.

## Project location

`/storage/emulated/0/apkbuilder/`

## Attribution

This repository is based on the upstream `TermuxVoid/apkgen-cli` source. Keep the original `LICENSE` and any applicable copyright/attribution notices when publishing modified copies. `apkzhi` is the customized command name, not a claim of original authorship over upstream components.
