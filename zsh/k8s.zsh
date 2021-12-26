# Kubernetes completion
source <(kubectl completion zsh)

# Kubernetes prompt configuration
# TODO: Show prompt without using kube_ps1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=""
KUBE_PS1_SEPARATOR=" "
KUBE_PS1_DIVIDER=" > "
KUBE_PS1_CTX_COLOR="white"
KUBE_PS1_NS_COLOR="white"

function set_kube_prompt() {
  KUBE_PROMPT="%K{black} $(kube_ps1) %k"
}

add-zsh-hook precmd set_kube_prompt
