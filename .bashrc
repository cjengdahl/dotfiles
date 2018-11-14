########################
#      Functions       #
########################

# navigate up <X> directories 
function up() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}

# dec --> char conversion (ascii)
function chr() {
  printf \\$(printf '%03o\\n' $1)
}

# char ---> dec conversion (ascii)
function ord(){
	LC_CTYPE=C printf '%d\n' "'$1"
}

########################
#  Navigation Aliases  #
########################

alias lsd="ls -d */" 
alias home='cd ~'
alias root='cd /'
alias dtop='cd ~/Desktop'
alias dbox='cd ~/Dropbox'
alias gdrive='cd ~/Google\ Drive'
alias gg='cd ~/git'

# uncomment for ubuntu
# alias open=xdg-open


########################
#     SSH Aliases      #
########################

source ~/.bash_ssh_aliases

########################
#    Utility Aliases   #
########################

# Setting aliases for virtual enviorments for python 2 and 3
alias virtualenv2="/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenv"
alias virtualenv3="/Library/Frameworks/Python.framework/Versions/3.5/bin/virtualenv"

alias todo="subl ~/Documents/Reference/todo.notes"
alias mkcd='function mkcd(){ mkdir $1; cd $1; };mkcd'

alias flip="if [ $((RANDOM %2)) -eq 1 ]; then echo HEADS; else echo TAILS; fi"
alias recent='cat ~/.bash_history | grep' 

alias burn="cat /dev/null > ~/.bash_history && history -c && exit"
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bash_profile'
alias sbashrc='source ~/.bash_profile'
alias todo='vim "+Note todo"' # vim-note plugin required
alias meow='cat'

########################
#     Git Aliases      #
######################## 

alias g='git'
alias st='git status'
alias com='git commit -m'
alias clone='git clone'
alias lg='git log'
alias all='git add .'

########################
#       Typos          #
########################

alias cta='cat'
alias gerp='grep'
alias sl='ls'
alias dc='cd'


########################
#    Unix Commands     #
########################

# Set Vim as my default editor
export EDITOR=vim

########################
#        PATHs         #
########################

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Applications/google-cloud-sdk/path.bash.inc ]; then
  source '/Applications/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Applications/google-cloud-sdk/completion.bash.inc ]; then
  source '/Applications/google-cloud-sdk/completion.bash.inc'
fi

# MacPorts Installer addition on 2016-10-20_at_18:09:36: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


########################
#      Display         #
########################

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh

# Command Prompt user@host working dir >>
export PS1="\u@\h\w >> " 
