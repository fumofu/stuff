#
trackpad=$(xinput list-props 12 | grep "\$libinput Tapping Enabled (300)")
trackpadcheck=$(echo trackpad | awk '{print $5}')

if [ "$trackpadcheck"="0" ]
then 
	echo "currently disabled" 
else
	echo "currently enabled" 
fi 
