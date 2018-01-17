# setup rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# add binstubs to PATH
export PATH="./bin:$PATH"
