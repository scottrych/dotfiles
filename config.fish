if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Auto-Warpify
status --is-interactive; and printf 'P$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish", "uname": "Darwin" }}'

# ShellHistory integration moved to ~/.config/fish/conf.d/30-shellhistory.fish
fish_add_path "/Applications/ShellHistory.app/Contents/Helpers"

# --- bobthefish theme configuration ---
set -g theme_powerline_fonts yes
set -g theme_display_date no
set -g theme_display_cmd_duration no
set -g theme_display_rprompt yes
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_jobs yes
set -g theme_short_path no
set -g theme_newline_cursor yes
set -g theme_newline_prompt " "
set -g theme_color_scheme dark

# --- Aliases ---
alias ll='ls -lah'
alias gs='git status'

# ROM organization aliases
alias organize-roms="python3 ~/\"Emulator Files/organize_roms.py\""
alias organize-roms-dry="python3 ~/\"Emulator Files/organize_roms.py\" --dry-run"

# Disk maintenance aliases
alias diskusage='df -h /'
alias clearcache='rm -rf ~/Library/Caches/* && echo "Caches cleared"'
alias largest='ls -lhS | head -10'

# --- API Keys (set these in a local, untracked file) ---
# set -gx GEMINI_API_KEY <your-key>
# set -gx OPENROUTER_API_KEY <your-key>

# --- AI / AFM ---
function ai_chat
    afm --single-prompt "$argv"
end

# Apple Intelligence AFM Server Configuration
set -gx AFM_PORT 9999
set -gx AFM_SERVER_URL "http://localhost:9999"

# Ollama Configuration
set -gx OLLAMA_ORIGINS "*"

function afm_start
    echo "Starting Apple Intelligence AFM server on port $AFM_PORT..."
    afm --port $AFM_PORT &
    echo "AFM server started. PID: $last_pid"
end

function afm_stop
    pkill -f "afm --port"
    echo "AFM server stopped"
end

function afm_status
    if pgrep -f "afm --port" > /dev/null
        echo "AFM server is running"
    else
        echo "AFM server is not running"
    end
end

function ai_vision
    afm vision $argv
end

# --- Toolchain ---
set -gx ZEPHYR_TOOLCHAIN_VARIANT gnuarmemb
set -gx GNUARMEMB_TOOLCHAIN_PATH /opt/homebrew
fish_add_path ~/zmk-python/bin

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Volumes/HomeX/Users/scottrych/.lmstudio/bin

# Added by Antigravity
fish_add_path /Volumes/HomeX/Users/scottrych/.antigravity/antigravity/bin

launchctl setenv OLLAMA_HOST "0.0.0.0"
