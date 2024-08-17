# Setup the PATH for pyenv binaries and shims
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH" # for poetry
type -a pyenv > /dev/null && eval "$(pyenv init --path)"

arch_name="$(uname -m)"

if [ "${arch_name}" = "x86_64" ]; then
    if [ "$(sysctl -in sysctl.proc_translated)" = "1" ]; then
        echo "Running on Rosetta 2... Homebrew is i386 brew i.e. /usr/local/bin/brew"
		eval "$(/usr/local/bin/brew shellenv)"
    else
        echo "Running on native Intel"
    fi
elif [ "${arch_name}" = "arm64" ]; then
    echo "Running on ARM... Homebrew is arm64 brew i.e. /opt/homebrew/bin/brew"
	eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Unknown architecture: ${arch_name}"
fi

# if command -v ngrok &>/dev/null; then
#   eval "$(ngrok completion)"
# fi

# source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
# source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
