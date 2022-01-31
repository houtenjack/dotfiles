source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle kubectl
antigen bundle poetry
antigen bundle docker
antigen bundle command-not-found
antigen bundle zoxide
antigen bundle tmuxinator
antigen bundle rsync
antigen bundle ripgrep
antigen bundle pyenv
antigen bundle gh
antigen bundle fzf
antigen bundle nvm
antigen bundle alias-finder

# Tell Antigen that you're done.
antigen apply

# tmux
if [ -z "$TMUX" ]
then
    cd ~;
    tmux attach -t TMUX || tmux new -s TMUX
fi

[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
[ -f ~/.ssh_aliases ] && source ~/.ssh_aliases

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

autoload -U compinit && compinit

eval "$(starship init zsh)"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# export PATH="$PATH:~/.local/bin"
# eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.poetry/bin:$PATH"

export ZSH_CACHE_DIR="${ZSH}/cache"

# Created by `pipx` on 2022-01-20 12:17:11
export PATH="$PATH:/home/jack/.local/bin"
