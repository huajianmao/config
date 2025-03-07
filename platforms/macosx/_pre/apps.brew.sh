#!/usr/bin/env bash

echo "正在安装 Homebrew..."

# 安装 Homebrew（新的安装命令）
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 安装命令行工具
BREW_APPS=(
  # aria2
  # asciidoctor
  autojump
  croc
  dos2unix
  findutils
  fswatch
  gh
  gitfs
  howdoi
  imagemagick
  mas
  # node
  octave
  p7zip
  # sshfs
  tmux
  tree
  vim
  wget
  # yarn
  
  # 开发必备工具
  git
  cmake
  ninja
  gcc
  make
  
  # 代码质量和分析
  shellcheck    # Shell 脚本语法检查
  ctags        # 代码标签工具
  
  # 实用开发工具
  jq           # JSON 处理工具
  yq           # YAML 处理工具
  fzf          # 模糊查找工具
  ripgrep      # 比 grep 更快的搜索工具
  bat          # 带语法高亮的 cat 替代品
  htop         # 更好的进程监控
  tldr         # 命令简化说明
  
  # 网络工具
  curl
  httpie       # 更友好的 HTTP 客户端
  mkcert       # 本地 HTTPS 开发证书工具
  nmap         # 网络扫描工具
  
  # 数据库相关
  mysql-client
  postgresql
  redis
  
  # 容器相关
  docker
  kubectl
  minikube
  
  # 版本管理
  nvm          # Node.js 版本管理
  pyenv        # Python 版本管理
  rbenv        # Ruby 版本管理
)

# 安装 GUI 应用
BREW_CASK_APPS=(
  # alfred
  alacritty
  android-platform-tools
  # android-studio
  # axure-rp
  basictex
  # calibre
  # cheatsheet
  # dash
  # datagrip
  # dropbox
  edex-ui
  enpass
  fliqlo
  flux
  # gimp
  # github
  google-chrome
  hammerspoon
  hyperswitch
  iina
  # imazing
  # insomnia
  inkscape
  intellij-idea
  itsycal
  karabiner-elements
  listen1
  maczip
  microsoft-edge
  # mindmaster
  miniconda
  # motrix
  neteasemusic
  netnewswire
  nextcloud
  notion
  obsidian
  # omnifocus
  # omnigraffle
  # openinterminal
  osxfuse
  pock
  prince
  pycharm
  # qlstephen
  rapidapi
  raycast
  # rectangle
  # sequel-ace
  # shadowsocksx-ng
  # sketch
  # snip
  # snipaste
  # spectacle
  ssh-tunnel-manager
  # tableplus
  # teamviewer
  tencent-lemon
  # thunder
  # v2rayu
  v2rayx
  # virtualbox
  visual-studio-code
  webstorm
  wechat
  wpsoffice
  # wkhtmltopdf
  # xmind
  
  # 开发工具
  postman              # API 测试工具
  docker               # 容器化工具
  sourcetree           # Git 图形界面
  mongodb-compass      # MongoDB 图形界面
  # tableplus          # 数据库管理工具
  
  # 实用工具
  # charles           # 网络抓包工具
  # wireshark         # 网络分析工具
  # vagrant           # 虚拟化管理工具
  
  # 协作工具
  # slack             # 团队沟通
  # microsoft-teams   # 团队协作
  # zoom              # 视频会议
  
  # 设计工具
  # figma             # 界面设计
  # zeplin            # 设计协作
)

# 安装 Nerd Font
echo "正在安装 Nerd Font..."
brew install --cask font-hack-nerd-font

# 安装命令行工具
echo "正在安装命令行工具..."
brew install ${BREW_APPS[@]}

# 安装 GUI 应用（更新的语法）
echo "正在安装 GUI 应用..."
brew install --cask ${BREW_CASK_APPS[@]}

# 清理缓存
echo "正在清理 Homebrew 缓存..."
brew cleanup
