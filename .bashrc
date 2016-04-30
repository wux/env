set -o emacs on

export PATH=$HOME/bin:$PATH

export EDITOR=/usr/bin/emacs

# Always enable normal heapcheck
export HEAPCHECK=normal

# Perforce setting.
export P4CONFIG=.p4config
export P4PORT=perforce.corp.upthere.com:1666
#export EDITOR=emacs  # or whatever else you prefer

export PATH=$HOME/go/bin:$PATH
export PATH=/usr/local/bin:$PATH:/usr/local/go/bin
export GOROOT=$HOME/go
export GOPATH=$HOME/gocode

# Source global definitions
if [ -f /etc/bashrc ]; then
 . /etc/bashrc
fi

# User specific aliases and functions
   alias a='alias'

   alias c='clear'

   h ()  { command history "$@" | more ; }

   alias home='cd /home/users/jwu/'
   alias u1='ssh jwu@upac01.prod.upthere.com'
   alias u2='ssh jwu@upac02.prod.upthere.com'
   alias u3='ssh jwu@upac03.prod.upthere.com'
   alias u4='ssh jwu@upac04.prod.upthere.com'
   alias u5='ssh jwu@upac05.prod.upthere.com'
   alias u6='ssh jwu@upac06.prod.upthere.com'
   alias u7='ssh jwu@upac07.prod.upthere.com'

   alias la='ls -a -h --color=auto'

   alias lc='ls -F -h --color=auto'

   #alias l='ls -l --color=tty'
   #alias ll='ls -lagF --color=auto'
   # For mac
   alias l='ls -lG'
   alias ll='ls -lagFG'

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

#eval $(keychain --eval -Q id_rsa)

   alias desktop='ssh -Y jwu@10.0.70.114'
   alias hot='ssh cp01-rdqa-dev411.cp01.baidu.com'
   alias relay='ssh relay01.baidu.com'
   alias tea='ssh jameswusv@szjjh-table-test2.szjjh01.baidu.com'
   alias p4src='cd /ssd/a/jwu/src/depot'

   alias svndiff='svn diff --diff-cmd tkdiff'

   alias psA='ps auxf'
   alias psE='ps -eLf'
   alias psL='ps -efww ef'

   alias p4dbg='cd /ssd/a/jwu/debug'
   alias p4opt='cd /ssd/a/jwu/release'

   alias huhehot='ssh jameswu@172.19.37.211'
   alias gpu1='ssh james@172.19.37.212'

# Display chinese char correctly
# http://stackoverflow.com/questions/4606570/os-x-terminal-utf-8-issues
# Go to Terminal->Preferences->Settings->Advanced.
# Under International, make sure the character encoding is set to Unicode (UTF-8).

# man less or more, then search LESSCHARSET.
# iso8859 is samiliar to ascii, but treat chars in [160 - 255] are treated as normal.
# This is critical for chinese chars incoded zh_CN.utf-8 (8 BIT but NOT UTF8!).
export LESSCHARSET=iso8859
#export LANG=en_US
export LANG="en_US.UTF-8"
set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

export PYTHONPATH=/usr/local/lib/python2.7/site-packages/

[[ -s "/home/users/jameswu/.jumbo/etc/bashrc" ]] && source "/home/users/jameswu/.jumbo/etc/bashrc"

