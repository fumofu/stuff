i3status | while : 
do 
	stat=$(playerctl status 2> /dev/null)
	artist=$(playerctl metadata artist 2> /dev/null)
	track=$(playerctl metadata title 2> /dev/null)
	read line
	echo "$stat: $artist - $track | $line" || exit 1  
done	

