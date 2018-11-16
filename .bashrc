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

mcd () {
    mkdir -p $1
    cd $1
}

function extract {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
  else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
  fi
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

alias mkcd='function mkcd(){ mkdir $1; cd $1; };mkcd'

alias flip="if [ $((RANDOM %2)) -eq 1 ]; then echo HEADS; else echo TAILS; fi"
alias recent='cat ~/.bash_history | grep' 

alias burn="cat /dev/null > ~/.bash_history && history -c && exit"
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bash_profile'
alias sbashrc='source ~/.bash_profile'
alias todo='vim "+Note todo"' # vim-note plugin required
alias meow='cat'
alias ll='ls -l'
alias la='ls -a'
alias top='htop'

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
