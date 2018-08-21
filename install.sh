echo "  _______/\        _________                _____.__        ";
echo " /  _____)/ ______ \_   ___ \  ____   _____/ ____\__| ____  ";
echo "/   \  ___ /  ___/ /    \  \/ /  _ \ /    \   __\|  |/ ___\ ";
echo "\    \_\  \\___ \  \     \___(  <_> )   |  \  |  |  / /_/  >";
echo " \______  /____  >  \______  /\____/|___|  /__|  |__\___  / ";
echo "        \/     \/          \/            \/        /_____/  ";
echo ".___                 __         .__  .__                    ";
echo "|   | ____   _______/  |______  |  | |  |   ___________     ";
echo "|   |/    \ /  ___/\   __\__  \ |  | |  | _/ __ \_  __ \    ";
echo "|   |   |  \\___ \  |  |  / __ \|  |_|  |_\  ___/|  | \/    ";
echo "|___|___|  /____  > |__| (____  /____/____/\___  >__|       ";
echo "         \/     \/            \/               \/           ";
echo "                                                            ";
echo "                                                            ";
echo "                                                            ";
echo "                                                            ";
echo " This script will copy Gabriel's scripts and configuration /n into the appropriate folders  ";
echo "";
read -p "Do you wish to proceed? " -n 1 -r 
if [[ $REPLY =~ ^[Yy]$ ]]
then 
	echo "Select the following options: ";
	echo "1) User Scripts"
	echo "2) User Configurations"
	echo "3) Programs" 
	echo "Example: 1 OR 1,2,3"
	read -p "Selection: " -n 1 -r 
	if [[ $REPLY =~ 1 ]] 
	then 
		install_configuration
	fi 
	if [[ $REPLY =~ 2 ]] 
	then
		install_scripts
	fi 
	if [[ $REPLY =~ 3 ]] 
	then
		install_programs
		install_scripts
	fi 
	
	echo "Done."
fi 
# Installs scripts from ./scripts  
install_scripts () {
	exec cp .config $HOME/.config/  
	echo "Configuration Complete."
	echo 
}
# Installs configuration from ./.config 
install_configuration () {
 	exec cp ./scripts/*.sh /usr/bin
	echo "Scripts installed."
	echo
}
# Installs programs
# In the future pacman will read from file
install_programs () {
 	exec yay -V > $YAYTEST 
	if ! [[ $YAYTEST =~ "^yay.*" ]]
	then
		echo 'Yay is not installed.'
		read -p 'Do you wish to install Yay?' 
		if [[ $REPLY =~ ^[Yy]]$ ]]
		then
			mkdir /var/git && cd /var/git
			git clone https://github.com/Jguer/yay 
			makepkg -si 	
		fi 
	fi 
	pacman -Syu && pacman -S i3-gaps, dmenu, xrandr, chromium, firefox, x-org, nvim, emacs, xfce4-notifyd, tlp 
	# Enables system services 
	systemctl enable xfce4-notifyd 
	tlp start
	# Enables 
	echo "EDITOR=nvim 
	VISUAL=EMACS" >> .bashrc
}
