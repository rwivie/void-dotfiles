#!/bin/sh

userresources=$HOME/.Xresources
#usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
#sysmodmap=/etc/X11/xinit/.Xmodmap

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

# user init scripts and settings
#[ -r ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -r ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -r ~/.xprofile ] && . ~/.xprofile

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

##twm &
##xclock -geometry 50x50-1+1 &
##xterm -geometry 80x50+494+51 &
##xterm -geometry 80x20+494-0 &
##exec xterm -geometry 80x66+0+0 -name login
## exec gnome-session
## exec startxfce4
#exec dbus-launch --sh-syntax --exit-with-session i3

#==== Starting applications without a window manager (will start application is full screen
#exec firefox

#==== to run a session
# Here Xfce is kept as default
session=${1:-xfce}
#==== use $xinit <session> or $startx ~/.xinitrc <session>
case $session in
    i3|i3wm           ) exec dbus-launch --sh-syntax --exit-with-session i3;;
#    kde               ) exec startplasma-x11;;
    xfce|xfce4        ) exec startxfce4;;
    # No known session, try to run it as command
    *                 ) exec $1;;
esac
