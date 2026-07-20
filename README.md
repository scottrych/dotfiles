# Dotfiles Configuration

This repository contains configuration files, aliases, and useful commands for my development environment.

## Table of Contents
- [Aliases](#aliases)
- [Common Commands](#common-commands)
- [NTFY Notifications](#ntfy-notifications)
- [Google Calendar (gcalcli)](#google-calendar-gcalcli)
- [SSH Configuration](#ssh-configuration)
- [Fish Shell Configuration](#fish-shell-configuration)
- [Starship Prompt](#starship-prompt)
- [Installation](#installation)

## Aliases

### Google Calendar
```bash
alias gcal="gcalcli --calendar='scottrych@gmail.com' --calendar='Family' --details title"
alias agenda="gcalcli --calendar='scottrych@gmail.com' --calendar='Family' agenda"
alias week="gcalcli --calendar='scottrych@gmail.com' --calendar='Family' calw"
```

### Notifications
```bash
alias notify="ntf send --pushover.priority normal"
alias notify-low="ntf send --pushover.priority low"
alias notify-high="ntf send --pushover.priority high"
alias notify-done="ntf done"
```

## Common Commands

### NTFY Notifications
Send notifications to all devices via Pushover from MacBook Pro.

Priorities: `emergency`, `high`, `normal`, `low`, `lowest`

#### Basic notification
```bash
ntf send --pushover.priority normal "Your message here"
```

#### Notify when command completes
```bash
ntf done COMMAND --pushover.priority low
```

#### Examples
```bash
ntf send --pushover.priority normal "Deployment completed"
tnf done "make build" --pushover.priority low
ntf send --pushover.priority high "Server down - immediate attention required"
```

### Google Calendar (gcalcli)

#### View today's agenda
```bash
gcalcli --calendar='scottrych@gmail.com' --calendar='Family' agenda
```

#### View this week's calendar
```bash
gcalcli --calendar='scottrych@gmail.com' --calendar='Family' calw
```

#### Add a new event
```bash
gcalcli --calendar='scottrych@gmail.com' add "Meeting with team" "2024-01-15 14:00" "1h"
```

#### Quick search events
```bash
gcalcli --calendar='scottrych@gmail.com' --calendar='Family' search "keyword"
```

## SSH Configuration

The `ssh_config` file is a sanitized template for SSH host configuration. To use it:

```bash
cp ~/dotfiles/ssh_config ~/.ssh/config
```

Then fill in your hostnames, usernames, and key file paths. The template includes sensible defaults for all hosts:

```
Host *
    ServerAliveInterval 60
    ServerAliveCountMax 3
```

## Fish Shell Configuration

`config.fish` is a sanitized fish shell config including:
- bobthefish theme settings
- AFM (Apple Intelligence) server functions (`afm_start`, `afm_stop`, `afm_status`)
- Ollama, LM Studio, and ZMK toolchain paths
- Placeholders for API keys

To use it:
```bash
cp ~/dotfiles/config.fish ~/.config/fish/config.fish
```

Store secrets in a separate untracked file:
```bash
# ~/.config/fish/conf.d/secrets.fish
set -gx GEMINI_API_KEY <your-key>
set -gx OPENROUTER_API_KEY <your-key>
```

## Starship Prompt

`starship.toml` configures the Starship cross-shell prompt.

Key settings:
- `scan_timeout = 1000` — increases the directory scan timeout to avoid warnings on slower or network-mounted volumes
- `[directory] read_only = "🔒"` — shows a lock emoji in read-only directories
- `[vagrant] disabled = true` — hides the Vagrant module

To use it:
```bash
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
```

## Installation

### 1. Clone this repository
```bash
git clone https://github.com/scottrych/dotfiles.git ~/dotfiles
```

### 2. Copy fish config (optional)
```bash
cp ~/dotfiles/config.fish ~/.config/fish/config.fish
```
Add your API keys to `~/.config/fish/conf.d/secrets.fish`.

### 3. Link Starship config
```bash
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
```

### 4. Copy SSH config (optional)
```bash
cp ~/dotfiles/ssh_config ~/.ssh/config
```
Fill in your hostnames, usernames, and key paths.

### 5. Add aliases to your shell profile
Add the following to `~/.config/fish/config.fish`:

```fish
if test -f ~/dotfiles/aliases.fish
    source ~/dotfiles/aliases.fish
end
```

### 6. Reload your shell
```bash
source ~/.config/fish/config.fish
```

## Configuration Examples

### gcalcli configuration
Create `~/.gcalclirc` for default settings:
```ini
[gcalcli]
default_calendar = scottrych@gmail.com
detail_length = title
```

### NTFY configuration
Ensure your ntfy configuration includes Pushover settings for cross-device notifications.

## Troubleshooting

### Calendar not showing
- Ensure you're authenticated: `gcalcli list`
- Check calendar names: `gcalcli --calendar-list`

### Notifications not working
- Verify ntfy configuration
- Check Pushover API settings
- Test with: `ntf send --pushover.priority normal "Test message"`