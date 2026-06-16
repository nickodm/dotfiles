# Because Ubuntu creates its own .bashrc, I decided to write my
# rc entries in a separate file.
#
# Add this line to the .bashrc to include this script in the execution:
# if [[ -f ~/.startup.sh ]]; then
#     . ~/.startup.sh
# fi

export LANG="en_GB.UTF-8"
export EDITOR="vim"
export PATH="$PATH:$HOME/.local/bin"
export STOW_DIR="$HOME/dotfiles"

if [[ "$(tty)" == /dev/pts* ]]; then
    # Not in a TTY
    POSH_THEME="main"
else
    # In a TTY
    POSH_THEME="simple"
fi

alias omp="oh-my-posh"
eval $(oh-my-posh init bash -c $HOME/.config/oh-my-posh/$POSH_THEME.toml)
