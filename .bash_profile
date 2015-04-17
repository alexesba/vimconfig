COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"
function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

export PS1="\[\e[01;32m\]\h\[\e[0m\]\[\e[01;37m\]@\[\e[0m\]\[\e[01;31m\]\u\[\e[0m\]\[\e[01;37m\]:\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\$(git_color)\]\$(git_branch)\[\033[0m\]\n$ "
export CLICOLOR=1
source ~/.bash_aliases

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
alias behat=vendor/bin/behat
alias reload='source ~/.bash_profile'
alias be='bundle exec'


# rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi


# Note to get rid of a line just Ctrl-C
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Modified version of what `composer _completion -g -p composer` generates
# Composer will only load plugins when a valid composer.json is in its working directory,
# so  for this hack to work, we are always running the completion command in ~/.composer
function _composercomplete {
    export COMP_LINE COMP_POINT COMP_WORDBREAKS;
    local -x COMPOSER_CWD=`pwd`
    local RESULT STATUS

    # Honour the COMPOSER_HOME variable if set
    local composer_dir=$COMPOSER_HOME
    if [ -z "$composer_dir" ]; then
        composer_dir=$HOME/.composer
    fi

    RESULT=`cd $composer_dir && composer depends _completion`;
    STATUS=$?;

    if [ $STATUS -ne 0 ]; then
        echo $RESULT;
        return $?;
    fi;

    local cur;
    _get_comp_words_by_ref -n : cur;

    COMPREPLY=(`compgen -W "$RESULT" -- $cur`);

    __ltrim_colon_completions "$cur";
};
complete -F _composercomplete composer;
export PATH=$PATH:~/.composer/vendor/bin
export PATH="/usr/local/sbin:$PATH"
