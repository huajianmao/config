arkcli() {
  case "$1" in
    list|profiles|ls)
      local base="$HOME/.arkcli"
      if [ ! -d "$base" ]; then
        echo "还没有任何 profile（$base 不存在）"
        echo "用 'arkcli <profile> init' 创建第一个吧"
        return 0
      fi

      local found=0
      local name
      while IFS= read -r name; do
        [ -z "$name" ] && continue
        found=1
        printf '  %s\n' "$name"
      done < <(find "$base" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; 2>/dev/null | sort)

      if [ "$found" -eq 0 ]; then
        echo "还没有任何 profile（$base 下没有子目录）"
        echo "用 'arkcli <profile> init' 创建第一个吧"
      fi
      ;;

    ""| -h | --help)
      cat <<'EOF'
用法:
  arkcli list                 列出所有 profile（同 profiles / ls）
  arkcli <profile> init       初始化并登录指定 profile
  arkcli <profile> <子命令..>  以指定 profile 执行 arkcli 子命令

示例:
  arkcli list
  arkcli ark1637 init
  arkcli ark1637 usage xxx
  arkcli ark_work auth status
EOF
      ;;

    *)
      local profile="$1"
      shift

      if [ -z "$profile" ]; then
        echo "用法: arkcli <profile> <子命令...>"
        return 1
      fi

      local subcmd="$1"
      if [ -z "$subcmd" ]; then
        echo "用法: arkcli <profile> <子命令...>"
        return 1
      fi

      # init 特殊处理：允许 profile 尚不存在，并自动构建镜像
      if [ "$subcmd" = "init" ]; then
        shift

        if ! docker image inspect arkcli:local >/dev/null 2>&1; then
          echo ">>> 构建镜像 arkcli:local ..."
          docker build -t arkcli:local . || return 1
        fi

        echo ">>> 初始化 profile: $profile"
        docker run -it --rm \
          --network host \
          -v "$HOME/.arkcli/$profile:/root" \
          arkcli:local auth login volc-sso "$@"
        return
      fi

      # 其他子命令：要求 profile 已存在
      if [ ! -d "$HOME/.arkcli/$profile" ]; then
        echo "profile '$profile' 不存在，先 'arkcli $profile init'"
        return 1
      fi

      docker run -it --rm \
        --network host \
        -v "$HOME/.arkcli/$profile:/root" \
        arkcli:local "$@"
      ;;
  esac
}
