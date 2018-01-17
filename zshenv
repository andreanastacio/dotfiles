export PATH="/usr/local/bin:/Users/andreluis/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/fzf/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/mysql/bin"
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

export V8_HOME="/usr/local/Cellar/v8/5.1.281.47/bin"

if [ -x /usr/libexec/path_helper ]; then
  if [ -z "$TMUX" ]; then
    eval `/usr/libexec/path_helper -s`
  fi
fi

# setup rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# add binstubs to PATH
export PATH="./bin:$PATH"
