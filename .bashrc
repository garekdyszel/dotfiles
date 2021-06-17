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
#shopt -s extglob

# set the install location for cmake in deal.ii programs
export DEAL_II_DIR=/usr/include/deal.ii-9.2.0/

# grab mail 
# use mbsync -a if you want to sync all the mailboxes
# use mu index if you want to tell mu where your emails are
alias mtu='mbsync mtu && notmuch new'
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

# add path for snap packages
export PATH=$PATH:/snap/bin

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

# printer name, in case we have to use it in the command line.
PRINTER="EPSON-WF-4720-Series"

# arranger, for automatically organizing files into predefined folder types
alias arranger="~/.bin/arranger"
alias kal="remind -b1 -c1 -@2,2 ~/notes/calendar.rem"

# quickly mount android phone for scans from the printer
alias android="aft-mtp-mount ~/mnt"

# make the arrow keys work in the TTY version of ksh
set -o emacs
#alias __A=`echo "\020"`     # up arrow = ^p = back a command
#alias __B=`echo "\016"`     # down arrow = ^n = down a command
#alias __C=`echo "\006"`     # right arrow = ^f = forward a character
#alias __D=`echo "\002"`     # left arrow = ^b = back a character
#alias __H=`echo "\001"`     # home = ^a = start of line
#alias __Y=`echo "\005"`     # end = ^e = end of line
# stty erase ^?               # allow for delete key to work
