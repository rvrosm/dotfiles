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

# kbd
xset r rate 200 30  


export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

fcitx5 &


# use cvt to generate modeline
# cvt 2880 1800 60
# 2880x1800 59.97 Hz (CVT 5.18MA) hsync: 111.84 kHz; pclk: 442.00 MHz
# Modeline "2880x1800_60.00"  442.00  2880 3104 3416 3952  1800 1803 1809 1865 -hsync +vsync
# mac Pro 15" 2018
xrandr --newmode "2880x1800_60.00"  442.00  2880 3104 3416 3952  1800 1803 1809 1865 -hsync +vsync
xrandr --addmode Virtual1 "2880x1800_60.00"
xrandr --output Virtual1  --mode 2880x1800_60.00 --dpi 226 

vmware-user

exec i3
