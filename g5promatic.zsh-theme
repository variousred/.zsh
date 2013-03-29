PROMPT='%F{cyan}$user@%m:%F{yellow}$(get_pwd)$(git_prompt_info)%{$reset_color%}→ '

local user=`whoami`

function get_pwd() {
  echo "${PWD/$HOME/~} "
}
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX "
}
ZSH_THEME_GIT_PROMPT_PREFIX="⭠ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}+"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}"
