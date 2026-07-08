# Because Ubuntu creates its own .bashrc, I decided to write my
# rc entries in a separate file.
#
# Add this line to the .bashrc to include this script in the execution:
# if [[ -f ~/.startup.sh ]]; then
#     . ~/.startup.sh
# fi

# --- ENVIRONMENT VARIABLES ---
export EDITOR="vim"
export PATH="$PATH:$HOME/.local/bin"
export STOW_DIR="$HOME/dotfiles"

# --- OH MY POSH ---
ompconfig="$HOME/.config/oh-my-posh"
alias omp="oh-my-posh"

omptheme() {
    if [[ ! -f "$ompconfig/$1.toml" ]]; then
        echo "Error: There is not a theme named \"$1\"." >&2
        return 1
    fi

    eval $(oh-my-posh init bash -c "$ompconfig/$1.toml")
}

if [[ "$(tty)" == /dev/pts* ]]; then
    # Not in a TTY
    POSH_THEME="main"
else
    # In a TTY
    POSH_THEME="simple"
fi

omptheme "$POSH_THEME"
