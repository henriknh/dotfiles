xrandr --output DisplayPort-1 --mode 1920x1080 --rate 144.00 --primary --output DVI-0 --auto --left-of DisplayPort-1
#xrandr --output HDMI-1 --mode 1920x1080 --primary --output HDMI-2 --auto --left-of HDMI-1
xrdb ~/.Xresources
exec i3
