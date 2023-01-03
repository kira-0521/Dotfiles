#################################  PATH  #################################
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.deta/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"


#################################  ALIAS  #################################
# zsh
alias l='exa --header --git --time-style=long-iso -agl'
alias lt='exa --icons -T -L 2 -a --git-ignore'
alias cat="bat --style=plain"
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias mk="mkdir"
alias zrc="vim ~/.zshrc"
alias gconf="vim ~/.gitconfig"


# Docker compose
alias dc="docker-compose"
alias dc-p="docker-compose ps"
alias dc-e="docker-compose exec"
alias dc-d="docker-compose down"
alias dc-s="docker-compose stop"
alias dc-u="docker-compose up -d"
alias dc-ub="docker-compose up -d --build"
alias dc-b="docker-compose build"
alias dc-l="docker-compose logs"
alias dc-il="docker-compose image list"
alias dc-ir="docker-compose image rm"


#################################  HISTORY  #################################
# history
HISTFILE=$HOME/.zsh-history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する


#################################  OTHER  #################################
# cdを使わずにディレクトリを移動できる
setopt auto_cd
cdpath=(.. ~ /)

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
