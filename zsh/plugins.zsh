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

#################################  GIT-COMPLETION  #################################
# git-prompt読み込み--ブランチ名常時表示--
source ~/.zsh/git-prompt.sh

# git-completion読み込み--git tab補完--
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit


###############################  POWERLINE  ##################################
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
