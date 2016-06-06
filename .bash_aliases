alias gs='git status'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gb='git branch'
alias ga='git add'
alias gap='git add --patch'
# alias laravel='php artisan'


# User commands
alias alex-log='git log --pretty=format:"%h%x09%an%x09%ad%x09%s" --date=short  --reverse --all'



# Custom configuration

# Install tab-completion for the lunchy gem
LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.bash ]; then
  . $LUNCHY_DIR/lunchy-completion.bash
fi

# Use Homebrew's terminal-notifier, which is much faster than Ruby's.
if [ -x /usr/local/bin/terminal-notifier ]; then
  export TERMINAL_NOTIFIER_BIN=/usr/local/bin/terminal-notifier
fi
