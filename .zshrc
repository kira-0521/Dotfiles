#################################  PATH & ALIAS  #################################
# PATH
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$BUN_INSTALL/bin:$PATH"

# k.tanaka
export PATH="/Users/k.tanaka/.deta/bin:$PATH"
export BUN_INSTALL="/Users/k.tanaka/.bun"


# zsh alias
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


# Git alias
alias co='checkout'
alias st='status'
alias br='branch' 


# Docker compose alias
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


#################################  ZPLUG  #################################
# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"


# インストールされていないプラグインがある場合は、プラグインをインストールする
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi


#################################  HISTORY  #################################
# history
HISTFILE=$HOME/.zsh-history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する


#################################  OTHERS  #################################
# cdを使わずにディレクトリを移動できる
setopt auto_cd
cdpath=(.. ~ /)

# git-prompt読み込み--ブランチ名常時表示--
source ~/.zsh/git-prompt.sh

# git-completion読み込み--git tab補完--
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# bun completions
[ -s "/Users/k.tanaka/.bun/_bun" ] && source "/Users/k.tanaka/.bun/_bun"


############################### POWERLINE ##################################
# powerline-shell設定
function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

# コマンドの実行ごとに改行
function powerline_precmd() {
  PS1="$(powerline-shell --shell zsh $?)
> % "
}


if [ "$TERM" != "linux" ]; then
  install_powerline_precmd
  powerline_precmd
fi

