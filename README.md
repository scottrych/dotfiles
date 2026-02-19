# Dotfiles Configuration

This repository contains configuration files, aliases, and useful commands for my development environment.

## Table of Contents
- [Aliases](#aliases)
- [Common Commands](#common-commands)
- [NTFY Notifications](#ntfy-notifications)
- [Google Calendar (gcalcli)](#google-calendar-gcalcli)
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
ntf done "make build" --pushover.priority low
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

## Installation

### 1. Clone this repository
```bash
git clone https://github.com/scottrych/dotfiles.git ~/dotfiles
```

### 2. Add aliases to your shell profile
Add the following to your `~/.zshrc` or appropriate shell configuration file:

```bash
if [ -f ~/dotfiles/aliases.sh ]; then
    source ~/dotfiles/aliases.sh
fi
```

### 3. Reload your shell
```bash
source ~/.zshrc
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
