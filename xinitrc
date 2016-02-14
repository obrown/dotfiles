[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

setxkbmap gb

xsetroot -solid '#191919' &
exec i3
