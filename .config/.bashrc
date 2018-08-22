#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -a'
alias battery='acpi -b'
alias swayconf='vi $HOME/.config/sway/config'
alias cls='clear'
alias vi='nvim'
alias em='emacs -nw'
alias fetch='neofetch'
alias i3conf='vi $HOME/.config/i3/config'
alias i3statconf='vi $HOME/.config/i3status/config'
alias clrclip='clipdel -d .*'
alias projects='cd $HOME/Nextcloud/projects/'
alias agenda="calcurse -r7 --format-apt='- %S -> %E\n\t%m\n%N'"
#alias todo="calcurse -t --format-todo '(%p) %m\n'"
alias bashrc="vi ~/.bashrc"



# Package Management

PS1='[\u@\h \W]\$ '
# >>> Added by cnchi installer
EDITOR=nvim
TERM=termite
VISUAL=nvim

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

