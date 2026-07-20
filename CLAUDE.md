# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Environment

- Shell: fish (`/opt/homebrew/bin/fish`)
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

## Dotfiles Repo

Tracked at https://github.com/scottrych/dotfiles. Local copy at `~/dotfiles/`.

Key files: `aliases.fish`, `config.fish`, `ssh_config`, `.gcalclirc`

Git remote uses SSH (`git@github.com:scottrych/dotfiles.git`). Push via terminal — Claude Code cannot access the macOS keychain.

## Fish Shell Config

Config at `~/.config/fish/config.fish` (tracked in dotfiles as `config.fish`). Includes:
- bobthefish theme settings
- AFM (Apple Intelligence) server functions: `afm_start`, `afm_stop`, `afm_status`
- Ollama, LM Studio, and ZMK toolchain paths

API keys are **not** in the repo — store them in `~/.config/fish/conf.d/secrets.fish`.

## Dotfiles Commands

Aliases defined in `dotfiles/aliases.fish` (fish) and `dotfiles/aliases.sh` (bash):

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

Source in fish: `source ~/dotfiles/aliases.fish`

## Arc Bookmark Converter (`main.py`)

Converts Arc Browser JSON exports to Netscape HTML bookmark format.

```bash
python3 main.py [-s] [-o output.html] [-v] [--version]
```
