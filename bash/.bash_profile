# preamble, utilities
function load_regular_file() {
    [[ -r "${1}" ]] && . "${1}"
}

# homebrew
eval "$(/usr/local/bin/brew shellenv)"

# bash completion
load_regular_file /usr/local/etc/profile.d/bash_completion.sh

# localise
load_regular_file ~/.bash_profile.local

# interactive shell
# https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html
# https://www.gnu.org/software/bash/manual/html_node/Is-this-Shell-Interactive_003f.html
if [ "${PS1}" != "" -a -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# post process
unset load_regular_file
