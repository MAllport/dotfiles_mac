### COMPLETION ###

autoload -Uz compinit
compinit

zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*'

### ANTIDOTE SETUP ###

zstyle ':antidote:bundle' use-friendly-names 'yes'
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

### FZF SEARCHES ###
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="mdfind -onlyin . -name ."
export FZF_ALT_C_COMMAND='fd --type directory'
export FZF_PREVIEW_ADVANCED=true
export LESSOPEN='| lessfilter-fzf %s'
export FZF_DEFAULT_OPTS='--reverse --border --exact --height=50%'

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search
bindkey "$terminfo[cuu1]" up-line-or-beginning-search
bindkey "$terminfo[cud1]" down-line-or-beginning-search

# fuzzy find: start to type
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search
bindkey "$terminfo[cuu1]" up-line-or-beginning-search
bindkey "$terminfo[cud1]" down-line-or-beginning-search

# backward and forward word with option+left/right
bindkey '^[^[[D' backward-word
bindkey '^[b' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[f' forward-word

# to to the beggining/end of line with fn+left/right or home/end
bindkey "${terminfo[khome]}" beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey '^[[F' end-of-line

# delete char with backspaces and delete
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

# delete word with ctrl+backspace
bindkey '^[[3;5~' backward-delete-word

zle     -N            fzf-cd-widget
bindkey -M emacs '\C-e' fzf-cd-widget
bindkey -M vicmd '\C-e' fzf-cd-widget
bindkey -M viins '\C-e' fzf-cd-widget

### HISTFILE ###

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
# there is for sure still some redundancy, but ...
# setopt BANG_HIST                 # Treat the '!' character specially during expansion.
# setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
#setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
#setopt HIST_BEEP                 # Beep when accessing nonexistent history.

### ZSH OPTS ###

unsetopt beep nomatch notify
setopt autocd extendedglob correct

### ALIASES ###

alias ls="exa"
alias ll="exa -l"
alias tree="tre"
alias cat="bat"

### MISC ###

# Used to alias GNU Coreutils commands without the 'g'-prefix. I.e. gdir -> dir
# This is used for LSCOLORS
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
zle -N edit-command-line
autoload -U edit-command-line
autoload -U promptinit; promptinit
# Dotfiles config command
alias config='/usr/bin/git --git-dir=/Users/michael/.cfg/ --work-tree=/Users/michael'
# Autocompletion for kubectl
source <(kubectl completion zsh)
export LESS='--mouse'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/michael/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/michael/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/michael/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/michael/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
