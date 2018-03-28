# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\u\[\033[01;34m\] \w\[\033[00;33m\]$(__git_ps1)\[\033[01;32m\] \$\[\033[00m\] '

alias sbash='source ~/.bashrc'
alias vbash='vim ~/.bashrc'
alias vros='vim ~/.rosrc'

libpathadd() {
	    if [ -d "$1" ] && [[ ":$LD_LIBRARY_PATH:" != *":$1:"* ]]; then
			        LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+"$LD_LIBRARY_PATH:"}$1"
					    fi
}
libpathadd "/usr/local/lib"


#Add Sublime to Path
PATH=$PATH:/opt/sublime_text
export PATH

alias sub='sublime_text'
alias sublime='sublime_text'
#alias rm=trash


source ~/.rosrc
source ~/.rosalias
export PATH=$PATH:/opt/sublime-text
alias sub=sublime-text
export PATH=$PATH:/opt/pycharm-community-2017.1.1/bin


# My aliases for convenience
alias sthor='ssh thor@192.168.0.108'
alias scap='ssh captjack@192.168.0.158'

alias scanip="nmap -sP 192.168.0.*"
export PATH=$PATH:/opt/gcc-arm-none-eabi-5_4-2016q3/bin
alias untar="tar -xvzf"

alias flashnaze='stm32flash -w ~/magicc/rosflight_ws/src/naze32.hex -v -g 0x0 -b 921600 /dev/ttyUSB0'

alias tenboard='tensorboard --logdir="."'
alias supercomp='ssh waffles@ssh.fsl.byu.edu'

alias cdros="cd `echo $ROS_PACKAGE_PATH | awk -Fsrc: '{print $1}'`/src"
alias ros_make="(cd `echo $ROS_PACKAGE_PATH | awk -Fsrc: '{print $1}'` && catkin_make -DCMAKE_BUILD_TYPE=Release)"

# CUDA Path Stuff
#export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64/

#export PATH=/usr/lib/ccache:$PATH
#export PYTHONPATH="${PYTHONPATH}:/usr/local/lib/python2.7/dist-packages"
#export PYTHONPATH="${PYTHONPATH}:~/.local/lib/python2.7/site-packages"

# Holodeck stuff
export HOLODECKPATH="/usr/local/Holodeck"
export PYTHONPATH="${HOLODECKPATH}:${PYTHONPATH}"

#alias rws='export ROS_WORKSPACE=$(pwd)'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
