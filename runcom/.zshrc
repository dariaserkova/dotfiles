
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="sunrise"
CASE_SENSITIVE="true"
# DISABLE_UPDATE_PROMPT="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(
  git
  kubectl
)
source $ZSH/oh-my-zsh.sh


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases

source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1$'\n''🐼 '

source ~/.bash_profile

export GPG_TTY=$(tty)
gpgconf --launch gpg-agent
