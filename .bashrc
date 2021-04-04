# add an alias for emacsclient so we don't have to remember how to connect to the Emacs daemon. 
alias em="emacsclient -c -a ''"

# set emacsclient as the default editor
export EDITOR="emacsclient -nw"
export VISUAL="emacsclient --create-frame"

# source the VisIt (scientific data visualization, typically FEM) program location.
# alias visit='/usr/local/visit/bin/visit'

# configuring dotfiles alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# launching LTSpice alias
alias ltspice='wine .wine/drive_c/Program\ Files/LTC/LTspiceXVII/XVIIx64.exe'

# enable doing things to all files except one, e.g. mv !(some file you want left alone)
shopt -s extglob

# set the install location for cmake in deal.ii programs
export DEAL_II_DIR=/usr/include/deal.ii-9.2.0/

# grab mail 
# use mbsync -a if you want to sync all the mailboxes
# use mu index if you want to tell mu where your emails are
alias mail='mbsync mtu && notmuch new'
alias gmail='mbsync gmail && notmuch new'

# set environment variables
export QT_QPA_PLATFORMTHEME=qt5ct # Qt theme controller
# export TERM=screen-24bit

# color output
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ip='ip --color=auto'

# add kitty completion commands
# source <(kitty + complete setup bash)

# fix rendering issue with anki
alias anki="ANKI_NOHIGHDPI=1 anki"

# add path for MEEP
# PATH=/home/chips/.local/bin:$PATH
# add path for ruby gems
PATH=$PATH:/home/chips/.local/share/gem/ruby/2.7.0/bin


# add alias for scholar (a command line reference manager)
alias scholar="~/go/bin/scholar"

# make libreoffice have our favorite dark theme
alias libreoffice="GTK_THEME=Breeze:dark libreoffice"

# backup files shell script
alias backup="/home/chips/.backup"

# macro to update system 
# (so I don't have to remember to fix my grub config every time the linux kernel is updated)
alias update="sudo pacman -Syu; sudo pacman -Syu linux linux-firmware linux-headers; 
	sudo mkinitcpio -p linux; grub-mkconfig -o /boot/grub/grub.cfg; 
	grub-install --target=i386-pc /dev/sdb; grub-mkconfig -o /boot/grub/grub/cfg; poweroff"

# printer
PRINTER="EPSON-WF-4720-Series"
