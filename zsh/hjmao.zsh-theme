function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "±" && return
  echo '○'
}

function box_name {
    echo $SHORT_HOST || echo $HOST
}

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'


PROMPT="┌─%{$FG[040]%}%n%{$reset_color%} at %{$FG[033]%}$(box_name)%{$reset_color%} in $FG[226]%}${current_dir}%{$reset_color%}${git_info}
└─${prompt_char}%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX=" <%{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}>"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}"
