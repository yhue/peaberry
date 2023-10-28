# utilities
. ~/.dotfile/bash/util

function load_regular_file() {
    [[ -r "${1}" ]] && . "${1}"
}

# homebrew
eval "$(/usr/local/bin/brew shellenv)"

# bash completion
load_regular_file "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# rtx
eval "$($(brew --prefix)/bin/rtx activate bash)"

# google cloud sdk
. "$(brew --prefix)/share/google-cloud-sdk/path.bash.inc"

# localise
load_regular_file ~/.bash_profile.local

# gnu tools
for bindir in "$(brew --prefix)/opt/"*"/libexec/gnubin"; do export PATH=$bindir:$PATH; done
for mandir in "$(brew --prefix)/opt/"*"/libexec/gnuman"; do export MANPATH=$mandir:$MANPATH; done

# interactive shell
# https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html
# https://www.gnu.org/software/bash/manual/html_node/Is-this-Shell-Interactive_003f.html
if [ "${PS1}" != "" -a -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# post process
unset load_regular_file
