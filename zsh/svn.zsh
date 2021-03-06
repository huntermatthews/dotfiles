######################
# This is the svn plugin from oh-my-zsh
# Created 2017-07-14
######################

svn_prompt_info() {
  local _DISPLAY
  if in_svn; then
    if [[ "$SVN_SHOW_BRANCH" = true ]]; then
      unset SVN_SHOW_BRANCH
      _DISPLAY=$(svn_get_branch_name)
    else
      _DISPLAY=$(svn_get_repo_name)
#      _DISPLAY=$(omz_urldecode "${_DISPLAY}")  ## hunter took this out.
    fi
    echo "$ZSH_PROMPT_BASE_COLOR$ZSH_THEME_SVN_PROMPT_PREFIX\
$ZSH_THEME_REPO_NAME_COLOR$_DISPLAY$ZSH_PROMPT_BASE_COLOR$ZSH_PROMPT_BASE_COLOR$(svn_dirty)$(svn_dirty_pwd)$ZSH_THEME_SVN_PROMPT_SUFFIX$ZSH_PROMPT_BASE_COLOR"
  fi
}

in_svn() {
  return 1   # !!! DISABLED !!!
  #svn info >/dev/null 2>&1
}

svn_get_repo_name() {
  if in_svn; then
    LANG=C svn info | sed -n 's/^Repository\ Root:\ .*\///p' | read SVN_ROOT
    LANG=C svn info | sed -n "s/^URL:\ .*$SVN_ROOT\///p"
  fi
}

svn_get_branch_name() {
  local _DISPLAY=$(
    LANG=C svn info 2> /dev/null | \
      awk -F/ \
      '/^URL:/ { \
        for (i=0; i<=NF; i++) { \
          if ($i == "branches" || $i == "tags" ) { \
            print $(i+1); \
            break;\
          }; \
          if ($i == "trunk") { print $i; break; } \
        } \
      }'
  )

  if [[ -z "$_DISPLAY" ]]; then
    svn_get_repo_name
  else
    echo $_DISPLAY
  fi
}

svn_get_rev_nr() {
  if in_svn; then
    LANG=C svn info 2> /dev/null | sed -n 's/Revision:\ //p'
  fi
}

svn_dirty() {
  svn_dirty_choose $ZSH_THEME_SVN_PROMPT_DIRTY $ZSH_THEME_SVN_PROMPT_CLEAN
}

svn_dirty_choose() {
  if in_svn; then
    local root=$(LANG=C svn info 2> /dev/null | sed -n 's/^Working Copy Root Path: //p')
    if svn status $root 2> /dev/null | command grep -Eq '^\s*[ACDIM!?L]'; then
      # Grep exits with 0 when "One or more lines were selected", return "dirty".
      echo $1
    else
      # Otherwise, no lines were found, or an error occurred. Return clean.
      echo $2
    fi
  fi
}

svn_dirty_pwd () {
  svn_dirty_choose_pwd $ZSH_THEME_SVN_PROMPT_DIRTY_PWD $ZSH_THEME_SVN_PROMPT_CLEAN_PWD
}

svn_dirty_choose_pwd () {
  if in_svn; then
    if svn status "$PWD" 2> /dev/null | command grep -Eq '^\s*[ACDIM!?L]'; then
      # Grep exits with 0 when "One or more lines were selected", return "dirty".
      echo $1
    else
      # Otherwise, no lines were found, or an error occurred. Return clean.
      echo $2
    fi
  fi
}

# Moved over from zprompt.zsh
SVN_CB="svn::"
ZSH_THEME_SVN_PROMPT_PREFIX="%{$fg[green]%}[${SVN_CB}"
ZSH_THEME_SVN_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_SVN_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_SVN_PROMPT_CLEAN=""

