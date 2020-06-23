# add an alias for emacsclient so we don't have to remember how to connect to the Emacs daemon. 
alias em="emacsclient -c -a ''"

# set Vim as the default editor inside the terminal
export VISUAL=vim
export EDITOR="$VISUAL"

# source the VisIt (scientific data visualization, typically FEM) program location.
alias visit='/usr/local/visit/bin/visit'

# configuring dotfiles alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# launching LTSpice alias
alias ltspice='wine .wine/drive_c/Program\ Files/LTC/LTspiceXVII/XVIIx64.exe'

# enable doing things to all files except one, e.g. mv !(some file you want left alone)
shopt -s extglob

# set the install location for cmake in deal.ii programs
export DEAL_II_DIR=/usr/include/deal.ii-9.2.0/

# shorten push command to send cfg files to remote server
alias configp='config push main master'

# set Qt 5 theme controller
export QT_QPA_PLATFORMTHEME=qt5ct
