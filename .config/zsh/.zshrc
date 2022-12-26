# Zinit plugin manager. To be loaded before compinit.
ZINIT_HOME="$HOME/.local/share/zinit/"
source "${ZINIT_HOME}/zinit.zsh"

# required for yadm encrypt
export GPG_TTY=$(tty)

# custom alias definitions
source $HOME/.config/zsh/aliases.zsh

# custom syntax highlighting
source ~/.config/zsh/syntax/catppuccin_frappe-zsh-syntax-highlighting.zsh

# history
export SAVEHIST=10000
export HISTSIZE=10000
export HISTFILE=~/.config/zsh/history
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt share_history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# completion
autoload -Uz compinit; compinit
zstyle ':completion:*' menu select
setopt completealiases

# Pure prompt
zinit light sindresorhus/pure
autoload -Uz promptinit; promptinit

PURE_PROMPT_SYMBOL="➜"
zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:prompt:success color 'green'

# PATH env variable
path+=('/home/ashleigh/.local/bin/')
path+=('/home/ashleigh/.platformio/penv/bin')
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# highlighting
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=white'
ZSH_HIGHLIGHT_STYLES[alias]='fg=white'

if command -v pio &> /dev/null; then
	# Begin: PlatformIO Core completion support
	eval "$(_PIO_COMPLETE=zsh_source pio)"
	# End: PlatformIO Core completion support
fi

