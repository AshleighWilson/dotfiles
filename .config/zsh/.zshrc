# Load Zinit plugin manager.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit"
source "${ZINIT_HOME}/zinit.zsh"

# Load Pure prompt
fpath+=$HOME/.config/zsh/pure
autoload -U promptinit; promptinit
prompt pure
PURE_PROMPT_SYMBOL="➜"
zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:prompt:success color 'green'

# Add homebrew to path.
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
