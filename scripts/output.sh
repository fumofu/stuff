# Script that passes outputs from xrandr to dmenu for presentation 
#dmenu="dmenu -i -b -fn 'Droid Sans Mono-12' -p"
displays=$(xrandr | grep -w "connected" | awk '{print $1}')
# Checks to see if input is empty, exits with error if true
[[ "$displays" = "" ]] && exit 1
chosen=$(echo "$displays"| dmenu -fn 'Droid Sans Mono-12' -i -b -p "Which Display?"| awk '{print $1}')
position=$(echo -e "normal\nleft\nright\noff" | dmenu -fn 'Droid Sans Mono-12' -i -b -p "$chosen:")
if [ "$position" = "" ]  
then 
	exit 1
elif [ "$position" = "off" ]
then
	xrandr --output $chosen --$position 
	notify-send -t 30 "$chosen is no longer outputed" 
	exit 0
else
	xrandr --output $chosen --$position-of eDP-1 --auto  
	notify-send -t 50 "$chosen is displayed $position" 
	exit 0 
fi 

