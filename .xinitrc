# source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# enable restart X
setxkbmap -option terminate:ctrl_alt_bksp 

# compose key
setxkbmap -option compose:ralt

# numlock
numlockx &

# set fonts
xset +fp /usr/share/fonts/local/ &
xset fp rehash &

# enable screensaver
xscreensaver -no-splash &

# set desktop wallpaper
sh $HOME/.fehbg &

# set cursor
xsetroot -cursor_name left_ptr &

# hide cursor
unclutter -noevents -idle 5 &

# start urxvt terminal emulation daemon
/usr/bin/urxvtd -q -o -f

# clipboard sync
/usr/bin/autocutsel -fork &
/usr/bin/autocutsel -selection CLIPBOARD -fork &

# check if scripts are running and start them if they are not
$HOME/scripts/proccheck &

# disk automounting
/usr/bin/udiskie -s &

# start gpg-agent daemon
eval $(gpg-agent --enable-ssh-support --daemon) &

# start mpd if not already running
[ ! -s $HOME/.mpd/mpd.pid ] && mpd

# let dwm do its magic :)
exec dbus-launch $HOME/scripts/dwmstart

