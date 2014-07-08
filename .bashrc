set -o emacs on

export PATH=$HOME/bin:$PATH

export EDITOR=/usr/bin/emacs

# Always enable normal heapcheck
export HEAPCHECK=normal

# Perforce setting.
export P4CONFIG=.p4config
export P4PORT=perforce.corp.upthere.com:1666
#export EDITOR=emacs  # or whatever else you prefer

# Source global definitions
if [ -f /etc/bashrc ]; then
 . /etc/bashrc
fi

# User specific aliases and functions
   alias a='alias'

   alias c='clear'

   h ()  { command history "$@" | more ; }

   alias home='cd /home/users/jwu/'
   alias u1='ssh jwu@upad01.upthere.com'
   alias u2='ssh jwu@upad02.upthere.com'

   alias la='ls -a -h --color=auto'

   alias lc='ls -F -h --color=auto'

   alias ll='ls -lagF --color=auto'

   alias ls='ls -F -h'

   alias cp='cp -i'

   alias mv='mv -i'

   alias rm='rm -i'

   alias xe='emacs -nw'

   alias xx='xemacs'

   alias back='set temp_dir = $old_dir:q; cd $temp_dir:q; unset temp_dir' 

   alias blackxe='xemacs -bg Black -fg MediumSpringGreen' 

   alias darkxe='xemacs -bg DarkGreen -fg Wheat' 

   alias forestxe='xemacs -bg ForestGreen' 

   alias limexe='xemacs -bg LimeGreen' 

   alias springxe='xemacs -bg MediumSpringGreen' 

   alias x='xterm -kt vt100 -font -*-fixed-medium-r-*-*-20-*-*-*-*-*-*-* -T "BLACK" -n $HOSTNAME -sb -bg black -cr red -fg green -geometry 80x60' 

   alias sx='xterm -kt vt100 -T "BLACK" -n $HOSTNAME -sb -bg black -cr red -fg green  -geometry 80x60' 

   alias bluex='xterm -kt vt100 -font -*-fixed-medium-r-*-*-20-*-*-*-*-*-*-* -T "BLUE" -n $HOSTNAME -sb -bg blue -cr red -fg yellow -geometry 80x60' 

   alias greenx='xterm -kt vt100 -font -*-*-medium-r-*-*-20-*-*-*-*-*-*-* -T "GREEN" -n $HOSTNAME -sb -bg darkgreen -geometry 80x60'

   alias grayx='xterm -kt vt100 -font -*-fixed-medium-r-*-*-20-*-*-*-*-*-*-* -T "GRAY" -sb -geometry 80x60'

   alias du='du --max-depth=1'

test -s ~/bin/bladefunctions && . ~/bin/bladefunctions || true
export BLADE_AUTO_UPGRADE=no

function ssh_prd1(){
  ssh $* upadmin@10.1.2.1 -t 'tmux a || tmux || /bin/bash'
}

function ssh_prd2(){
  ssh $* upadmin@10.1.2.2 -t 'tmux a || tmux || /bin/bash'
}

eval $(keychain --eval -Q id_rsa)

   alias desktop='ssh -Y jwu@10.0.70.114'

   alias p4src='cd /ssd/a/jwu/src/depot'

   alias svndiff='svn diff --diff-cmd tkdiff'

   alias psA='ps auxf'
   alias psE='ps -eLf'
   alias psL='ps -efww ef'
