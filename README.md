# Dotfiles Configuration

This repository contains configuration files, aliases, and useful commands for my development environment.

## Table of Contents
- [Aliases](#aliases)
- [Common Commands](#common-commands)
- [NTFY Notifications](#ntfy-notifications)
- [Google Calendar (gcalcli)](#google-calendar-gcalcli)
- [Nessus Agent](#nessus-agent)
- [Installation](#installation)

## Aliases

### Google Calendar
```bash
# Quick calendar access with specific calendars and details
alias gcal="gcalcli --calendar='scottrych@gmail.com' --calendar='Family' --details title"

# Show today's agenda
alias agenda="gcalcli --calendar='scottrych@gmail.com' --calendar='Family' agenda"

# Show this week's calendar
alias week="gcalcli --calendar='scottrych@gmail.com' --calendar='Family' calw"
```

### Notifications
```bash
# Quick notification aliases
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
# Send a normal priority notification
ntf send --pushover.priority normal "Deployment completed"

# Send a low priority notification when a long-running command finishes
ntf done "make build" --pushover.priority low

# Send a high priority alert
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

### Nessus Agent

#### Link Nessus Agent
```bash
/opt/nessus_agent/sbin/nessuscli agent link --key=a79bfc5756cbd9f44cbadb9eed15e50558bd2c133940e9d20e1a356b8d7e79f1 --cloud --groups="All" --port=443
```

## Installation

### 1. Clone this repository
```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Add aliases to your shell profile
Add the following to your `~/.bashrc`, `~/.zshrc`, or appropriate shell configuration file:

```bash
# Source dotfiles aliases
if [ -f ~/dotfiles/aliases.sh ]; then
    source ~/dotfiles/aliases.sh
fi
```

### 3. Create aliases file
Create `~/dotfiles/aliases.sh` with your preferred aliases:

```bash
#!/bin/bash

# Google Calendar aliases
alias gcal="gcalcli --calendar='scottrych@gmail.com' --calendar='Family' --details title"
alias agenda="gcalcli --calendar='scottrych@gmail.com' --calendar='Family' agenda"
alias week="gcalcli --calendar='scottrych@gmail.com' --calendar='Family' calw"

# Notification aliases
alias notify="ntf send --pushover.priority normal"
alias notify-low="ntf send --pushover.priority low"
alias notify-high="ntf send --pushover.priority high"
alias notify-done="ntf done"
```

### 4. Reload your shell
```bash
source ~/.bashrc  # or ~/.zshrc
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

## Useful Tips

- Use `CMD + ↑/↓` on macOS or `CTRL-SHIFT + ↑/↓` on Linux to jump between command blocks
- Use `CMD + ENTER` or `CTRL-ENTER` on Linux to run command blocks in supported terminals
- Combine commands with notifications: `make build && notify "Build completed"`
- Use different priority levels based on urgency of notifications

## Troubleshooting

### Calendar not showing
- Ensure you're authenticated: `gcalcli list`
- Check calendar names: `gcalcli --calendar-list`

### Notifications not working
- Verify ntfy configuration
- Check Pushover API settings
- Test with: `ntf send --pushover.priority normal "Test message"`

---

*Last updated: $(date)*
