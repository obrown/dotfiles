[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

setxkbmap gb -option caps:escape &
compton --vsync opengl -b &
sh ~/.fehbg &
# (bar | lemonbar -B '#66000000') &
exec i3
