# prepend a custom font path to Xorg's list of known font paths
xset +fp /usr/share/fonts/local/

# set desktop wallpaper
feh --image-bg black --bg-center $HOME/pictues/3/ninja.jpg

# let dwm do its magic :)
$HOME/scripts/dwmstart
#exec dwm

# start dropbox daemon
dropboxd

# start gpg-agent daemon
eval $(gpg-agent --enable-ssh-support --daemon) &

