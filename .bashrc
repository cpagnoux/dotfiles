#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Alias for downloading latest stable version of Adminer in public_html
alias get-adminer-latest='wget https://www.adminer.org/latest-en.php \
	-O ~/public_html/adminer-en.php'

# Alias for generating self-signed SSL certificate for testing purpose
alias ssl-cert-gen='openssl req -new -x509 -nodes \
	-out ~/Documents/server.crt \
	-keyout ~/Documents/server.key'

# Aliases for controlling Quake Live awesomium_process
alias awesomium-stop='killall -STOP awesomium_process.exe'
alias awesomium-cont='killall -CONT awesomium_process.exe'

# Alias for starting Demopan with TF2 path
tf2_path='~/.local/share/Steam/steamapps/common/Team\ Fortress\ 2/tf'
alias demopan-tf2="demopan -w $tf2_path --demos $tf2_path"
unset tf2_path

. /usr/share/git/completion/git-prompt.sh
PS1='\e[1m\w$(__git_ps1 " \e[92m(%s)\e[39m") \$\e[0m '

if [[ -d ~/.bash_completion.d ]]; then
	for completion in ~/.bash_completion.d/*; do
		[[ -f "$completion" ]] && . "$completion"
	done
	unset completion
fi

eval "$(symfony-autocomplete)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
