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

# Utility aliases
alias ll="ls -la"
alias la="ls -la"
alias ..="cd .."
alias ...="cd ../.."

# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline"
