# add an alias for emacsclient so we don't have to remember how to connect to the Emacs daemon. 
alias em='emacsclient --create-frame'

# set Vim as the default editor inside the terminal
export VISUAL=vim
export EDITOR="$VISUAL"

# source the VisIt (scientific data visualization, typically FEM) program location.
alias visit='/usr/local/visit/bin/visit'

# configuring dotfiles alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
