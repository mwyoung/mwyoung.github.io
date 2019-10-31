# Modifications - Commands when opening new terminal
PROMPT_DIRTRIM=3                # only show 3 directories
export PYTHONUSERBASE=$HOME/.local
export PATH=$PATH:$(pwd):$HOME/.local/bin:$(ruby -e 'puts Gem.user_dir')/bin
export QUOTING_STYLE=literal	#changes ls so no 'name space'
export PROMPT_COMMAND='history -a' #multiple terminals, save history
export HISTSIZE=1000            #save more history
HISTCONTROL=ignoredups          #ignore duplicates

#alias svr="ssh -X user@host.com"
#go to most recently used folder
alias atmega="cd $(ls -td ~/Documents/Projects/Atmega328/*/ | head -1)"
#avoid atmega directory
alias project="cd $(ls -td -I "Atmega328/" ~/Documents/Projects/*/ | head -1)"

alias hg="history | grep "  #search history

stty -ixon              #stop terminal freezes
set bell-style none     #no bell
shopt -s checkwinsize   #proper window checking
shopt -s autocd         #cd dir with name
