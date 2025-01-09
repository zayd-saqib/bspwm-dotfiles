# SET HISTORY
# Set the history file
HISTFILE=~/.zsh_history

# Number of history entries to save in the file
HISTSIZE=10000

# Number of history entries to keep in memory
SAVEHIST=10000

# Append to the history file, don't overwrite
setopt APPEND_HISTORY

# Share history across all sessions
setopt SHARE_HISTORY

# Record timestamps for history entries
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# ZSH SYNTAX HIGHLIGHTING
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[path]='fg=magenta' 
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'

eval "$(starship init zsh)" # activate starship
# get zsh syntax highlighting and substring search
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# activate zsh substring search with up arrow
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
