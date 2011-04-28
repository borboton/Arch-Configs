#!/bin/bash
# Check for an interactive session
PS1='\[\e[1;35m\]\u\[\e[m\] \[\e[1;36m\]\w\[\e[m\] \[\e[1;32m\]> \[\e[m\]\[\e[0;37m\]'
#PS1='\[\e[0;32m\]\u\[\e[m\]\[\e[1;34m\]\w\[\e[m\]\[\e[m\]\[\e[1;32m\] $\[\e[m\]\[\e[1;37m\] > '
#PS1='\[\e[1;35m\]\u\[\e[m\] \[\e[1;36m\]\w\[\e[m\] \[\e[1;32m\]> \[\e[m\]\[\e[0;37m\]'

[ -f ~/.bash_functions ] && source $HOME/.bash_functions
[ -f ~/.bash_alias ] && source $HOME/.bash_alias

export JAVA_FONTS='/usr/share/fonts/TTF'
export EDITOR='vim'
export BROWSER='/usr/bin/icecat'
export PAGER='/bin/less'
#export LC_ALL=
export LC_COLLATE="C"
export LANG='en_US.UTF-8'
export SDL_VIDEO_X11_DGAMOUSE=0
export ORACLE_HOME='/opt/instantclient'
export TNS_ADMIN=${ORACLE_HOME}
