# Lines configured by zsh-newuser-install
HISTFILE=~/.zshhistfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "/home/$USER/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[green]%}%d ~ %{$reset_color%}%# "
RPROMPT="[%{$fg_no_bold[yellow]%}%@%{$reset_color%} ]"

TMOUT=20
TRAPALRM() {
	if [ "$WIDGET" != "complete-word" ]; then
		zle reset-prompt
	fi
}

#LS_COLORS='di=00;33:ln=04;36:so=01;35:pi=40;33:ex=31:bd=40;33;01:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30:no=00;37:fi=00:'
#LS_COLORS='no=00;32:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
#export LS_COLORS
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export TERM=screen-256color

# alias

if [ $(uname -s) = 'Darwin' ]; then
	LS_OPTION='-FHG'
else
	LS_OPTION='--color=always'
fi

alias ls='ls $LS_OPTION'

alias vim="NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"

alias sshkey="cat ~/.ssh/id_rsa.pub"

alias cls="clear"

if `which ag > /dev/null`; then
	alias grep="ag"
fi

if [ -f ~/.zsh_alias ]; then
	source ~/.zsh_alias
fi

if [ -f ~/.zprofile ]; then
	source ~/.zprofile
fi

# git alias
alias ginit='git init;cp $HOME/workspace/dotfiles/gitignore .gitignore'
alias gstatus='git status'
alias gadd='git add '
alias gcommit='git commit -m '
alias gpush='git push '
alias gpull='git pull '
alias fastgit='git add . && git commit && git push origin master'
alias whatismyip='wget -qO- ipinfo.io/ip'
alias projects='cd $HOME/workspace/projects'
alias env_source='source env/bin/activate'
alias env_create='virtualenv env'
alias to_requirement='pip freeze > requirements.txt'
alias tutorial='cd $HOME/workspace/projects/tutorial'
alias personal='cd $HOME/workspace/projects/personal'
