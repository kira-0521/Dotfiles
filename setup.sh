#!/bin/bash

echo "Xcodeをインストールします..."
xcode-select --install

#------------------------------------------
# homebrew(arm64
#------------------------------------------
echo "homebrewをインストールします..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "brew doctorを実行します..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew doctor

echo "brew updateを実行します..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew update --verbose

echo "brew upgradeを実行します..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew upgrade --verbose

echo ".Brewfileで管理しているアプリケーションをインストールします..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew bundle --file ./.Brewfile --verbose

echo "brew cleanupを実行します..."
which brew >/dev/null 2>&1 && brew cleanup --verbose


#------------------------------------------
# volta
#------------------------------------------
echo "voltaをインストールしています..."
/bin/bash -c "$(curl -fsSL https://get.volta.sh)"

echo "voltaよりnodeをインストールしています..."
volta install node


#------------------------------------------
# シンボリックリンク
#------------------------------------------
# 配置したい設定ファイル
DOT_FILES=(.zshrc, .gitconfig)

# .zshrc という設定ファイルのシンボリックリンクを
# ホームディレクトリ直下に作成する
for file in "${DOT_FILES[@]}"; do
        ln -svf $file ~/
done

exec $SHELL -l
