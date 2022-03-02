# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1="\[\033[1;37m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;34m\]\u@\h'; fi)\[\033[1;37m\])\$([[ \$? != 0 ]] && echo \"\342\224\200(\[\033[0;31m\]\342\234\227\[\033[1;37m\])\")\342\224\200(\[\033[1;34m\]\@ \d\[\033[1;37m\])\[\033[1;37m\]\n\342\224\224\342\224\200(\[\033[1;32m\]\w\[\033[1;37m\])\342\224\200(\[\033[1;32m\]\$(ls -1 | wc -l | sed 's: ::g') files, \$(ls -sh | head -n1 | sed 's/total //')b\[\033[1;37m\])\342\224\200> \[\033[0m\]"
#PS1="\[\033[01;32m\]  \[\033[1;34m\](\[\033[01;34m\]\u@\h)(\[\033[1;32m\]\@ \d\[\033[1;32m\])\[\033[1;33m\](\[\033[1;33m\]\w\[\033[1;33m\])$ \[\033[0m\]"

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
#		PS1='\[\033[01;36m\][\u@\h\[\033[01;37m\] \W\[\033[01;36m\]]\$\[\033[00m\] '
                PS1="\[\033[01;32m\]  \[\033[1;34m\](\[\033[01;34m\]\u@\h)(\[\033[1;32m\]\@ \d\[\033[1;32m\])\[\033[1;33m\](\[\033[1;33m\]\w\[\033[1;33m\])$ \[\033[0m\]"
	fi


#==== so we can see
umask 0002
#=============
#==== alias's
#=============
alias startx="startx > $HOME/startx.log 2>&1"

alias upg='sudo xbps-install -Su'
#alias inst='sudo xbps-install -S'
alias inst='sudo xbps-install'
alias serv='sudo sv status /var/service/*'
alias syslog='svlogtail'
alias nethogs="sudo nethogs wlp3s0"
alias iftop="sudo iftop -i wlp3s0"
alias nethogs-eth="sudo nethogs enp7s0"
alias iftop-eth="sudo iftop -i enp7s0"
#--- misc aliases
alias clock="tty-clock -sSctB -C 6"
alias obxprop='xprop | grep "^_OB_APP"'
alias vkpurge="sudo vkpurge rm all"
alias sued="sudo -i nano"
alias thunar="dbus-launch thunar"

#==== for git dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

#==== auto cd
shopt -s autocd

#==== exports
export EDITOR='nano'
export VISUAL='mousepad'
export BROWSER="firefox"
export XBPS_DISTDIR=/home/ron/void-packages

if [[ $STICKY_NOTE ]]; then
  PS1=
  cat "$HOME/tmp/sticky-note"
  return
fi
