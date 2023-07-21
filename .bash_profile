# /etc/skel/.bash_profile

if [ -z $TMUX ]; then
    PHUNC20HOME="/home/phunc20"
    export PATH="$PATH:$PHUNC20HOME/go/bin:/usr/sbin:$PHUNC20HOME/.local/bin:$PHUNC20HOME/.useful:$PHUNC20HOME/.config/miniconda3/bin"
    unset PHUNC20HOME
fi

# This file is sourced by bash for login shells. 
# The following line runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
  . ~/.bashrc
fi
