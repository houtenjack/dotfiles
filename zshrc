# The following lines were added by compinstall

zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/ixi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch notify
unsetopt autocd beep
# End of lines configured by zsh-newuser-install
source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle zsh-autosuggestions
antigen bundle zsh-syntax-highlighting
antigen bundle kubectl
antigen bundle poetry
antigen bundle docker
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

alias zshconfig="vi ~/.zshrc"
alias dotfiles="cd ~/dotfiles"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias i3config='vi ~/.config/i3/config'
alias reload='source ~/.zshrc'

# tmux
if [ -z "$TMUX" ]
then
    cd ~;
    tmux attach -t TMUX || tmux new -s TMUX
fi

# exa
if [ "$(command -v exa)" ]; then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'la'
    unalias -m 'ls'
    alias ls='exa -G  --color auto --icons -a -s type'
    alias ll='exa -l --color always --icons -a -s type --git'
fi

# bat
if [ "$(command -v bat)" ]; then
  unalias -m 'cat'
  alias cat='bat --theme="Dracula"'
fi

# fd-find
alias fd="fdfind"
# nvim
alias v="nvim"

[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

autoload -U compinit && compinit

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$PATH:~/.local/bin"
eval "$(pyenv virtualenv-init -)"
