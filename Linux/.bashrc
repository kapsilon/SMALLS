#UBUNTU BASH SETTINGS
case $- in
    *i*) ;;
      *) return;;
esac
#History
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize
#Environment
color_prompt=yes
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
#Completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#UNIVERSAL ALIASES
alias aptsearch='apt search --names-only'
alias byebye='sudo shutdown -r now'
alias edit='nano -NSmu$'
alias dirspace='du -h --max-depth=1'
alias diskspace='df -h --exclude-type=tmpfs --exclude-type=devtmpfs'
alias grep='grep --color --ignore-case'
alias goodbye='sudo shutdown -h now'
alias ls='ls --color --group-directories-first -p'
alias lsa='ls --color --group-directories-first -p -A'
alias lsl='ls --color --group-directories-first -p -A -lh --time-style=iso'
alias mkdir='mkdir -p'
alias rm='rm -iv'
alias rmdir='rm -iRv'
alias sudo='sudo '
alias view='nano -Svm$'
alias version='neofetch'
export EDITOR='nano -NSmu$'
export VISUAL='nano -Svm$'
export TERM='xterm-256color'

#LITTLE APPLICATIONS
alias cdi='cd `(echo ".." &&
          ls -A --color=never --group-directories-first -p) |
          (peco --initial-index=1 --on-cancel=error --prompt="INTERACTIVE-CD: $PWD" --selection-prefix=+ || echo ".")
          `'
alias upupaway='echo -e "\033[7mapt update\033[0m"; sudo apt update &&
                echo -e "\033[7mapt upgrade\033[0m"; sudo apt upgrade --yes &&
                echo -e "\033[7mapt autoremove\033[0m"; sudo apt autoremove --yes'
alias weather='curl ru.wttr.in/Moscow?0QT'
export PS1='\[\e]0;\h\a\]${debian_chroot:+($debian_chroot)}\[\033[01;07;34m\]\u@\h\[\033[00m\]\[\033[07;37m\] \w \[\033[00m\]\[\033[01;07;32m\]\$\[\033[00m\] '

#----------------------------------------------------

#Minimal PS1 for Android Termux
export PS1='[\033[07;37m\] \w \[\033[00m\]\[\033[01;07;92m\]\$\[\033[00m\] '

#Battery status in terminal Knb
export PS1BAT='\[\033[07;31m\][$(cat /sys/class/power_supply/BAT0/capacity)%]\[\033[00m\]'

#PS1 for Ubuntu on Windows - other colors
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;07;94m\]\u@\h\[\033[00m\]\[\033[07;37m\] \w \[\033[00m\]\[\033[01;07;92m\]\$\[\033[00m\] '

#Mount all disks at K1
alias mountall='sudo mount /Документы/; sudo mount /Загрузки/; sudo mount /Игры/; sudo mount /Разное/'
