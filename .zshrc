# Ruta a la instalación de Oh My Zsh.
export ZSH="$HOME/.oh-my-zsh"
# export LEGION-KB-RGB="~/Descargas/legion-kb-rgb-linux/"

# Inicio automático
fastfetch | lolcat --force

# Tema
ZSH_THEME="duellj"

# ¿Te gustaría usar otra carpeta personalizada que no sea $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# ¿Qué plugins te gustaría cargar?
# Los plugins estándar se pueden encontrar en $ZSH/plugins/
# Los plugins personalizados se pueden agregar en $ZSH_CUSTOM/plugins/
# Formato de ejemplo: plugins=(rails git textmate ruby lighthouse)
# Agrega con cuidado, ya que demasiados plugins ralentizan el inicio del shell.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Establecer el directorio donde queremos almacenar zinit y plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Descargar Zinit, si aún no está allí
#if [ ! -d "$ZINIT_HOME" ]; then
#   mkdir -p "$(dirname $ZINIT_HOME)"
#   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
#fi

# Cargar zinit
source "${ZINIT_HOME}/zinit.zsh"

# Agregar plugins de zsh
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Agregar snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
#zinit snippet OMZP::aws
#zinit snippet OMZP::kubectl
#zinit snippet OMZP::kubectx

# Cargar completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Historial
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Estilo de completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Alias
alias ls='ls --color -a'
alias c='clear'
alias f='fzf'
alias fastfetch='fastfetch | lolcat --force'
alias cat='bat'
alias nano='micro'
alias vim='micro'
alias nvim='micro'
alias m='micro'


# Integraciones del shell
eval "$(fzf --zsh)"
# eval "$(zoxide init --cmd cd zsh)"

# Rutas adicionales
export PATH=$PATH:/bin
export PATH=$PATH:/home/d4mag3/Descargas/idea-IU-243.25659.59/bin/idea.sh
export PATH=$PATH:/home/d4mag3/.spicetify

export ELECTRON_OZONE_PLATFORM_HINT=auto
