#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# turn on custom keyboard layout
#exec setxkbmap -model pc105 -layout us -option hyper:rctl -option caps:ctrl_modifier -option ctrl:swap_lalt_lctl -option shift:both_capslock -option compose:ralt -option grp:alt_shift_toggle

# set Qt 5 theme controller to get breeze dark everywhere
#export QT_QPA_PLATFORMTHEME=qt5ct

# turn on numlock on boot
numlockx &

# run i3
twm &
exec i3

# set the dark theme for all GTK apps
GTK_THEME=Breeze:dark

# remove the mouse cursor when not using it
#unclutter &
