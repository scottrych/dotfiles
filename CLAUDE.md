# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Environment

- Shell: fish (`/opt/homebrew/bin/fish`), zsh with Oh-My-Zsh also configured
- Package manager: Homebrew at `/opt/homebrew/bin`
- Prefer `trash` over `rm` for file deletion (recoverable)

## Repository Structure

This is a personal home directory containing several distinct projects:

- `dotfiles/` — Shell aliases and tool configuration
- `Obtainium-main/` — Flutter/Dart Android app for tracking app updates
- `work/` — Work-related files and MCP server templates
- `main.py` — Arc Browser bookmark converter utility

## Obtainium Build (Flutter)

Located at `Obtainium-main/`. Build script: `./build.sh`

```bash
flutter pub get                                              # Install dependencies
flutter build apk --flavor normal                           # Standard APK
flutter build apk --split-per-abi --flavor normal           # Per-architecture APKs
flutter build apk --flavor fdroid -t lib/main_fdroid.dart   # F-Droid flavor
```

State management via `provider`. Build flavors: `normal` and `fdroid`.

## Dotfiles Commands

Aliases defined in `dotfiles/aliases.sh`:

```bash
# Calendar (gcalcli)
gcal        # Show calendar with title details
agenda      # Today's agenda
week        # This week's calendar view

# Notifications (ntfy → Pushover)
notify "msg"          # Normal priority
notify-high "alert"   # High priority
notify-low "info"     # Low priority
notify-done "cmd"     # Notify when command completes
```

Source dotfiles by adding to shell config: `source ~/dotfiles/aliases.sh`

## Arc Bookmark Converter (`main.py`)

Converts Arc Browser JSON exports to Netscape HTML bookmark format.

```bash
python3 main.py [-s] [-o output.html] [-v] [--version]
```
