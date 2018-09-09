# rbenv setup
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv setup
export PATH="$HOME/.pyenv/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# ndenv setup
export PATH="$HOME/.ndenv/bin:$PATH"
if which ndenv > /dev/null; then eval "$(ndenv init -)"; fi

# crenv setup
export PATH="$HOME/.crenv/bin:$PATH"
if which crenv > /dev/null; then eval "$(crenv init -)"; fi

export ANDROID_HOME=/usr/lib/android-sdk
export DEV_TLD_DOMAINS=localhost,test

# puma-dev setup
export PATH="$HOME/.puma-dev/bin:$PATH"
export EDITOR=vim

# add binstubs to PATH
export PATH="./bin:$PATH"
