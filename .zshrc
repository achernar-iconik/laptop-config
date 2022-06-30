# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###########################
### Achernar Section \/ ###
###########################

alias e='nano /Users/achernar/.zshrc'
alias r='source /Users/achernar/.zshrc'
alias reload='r'
alias c='clear'
alias ll='ls --color=auto -alF'
alias k='kubectl'
alias kube='k'
alias kn='kubectl config set-context --current --namespace'
alias ke='kubectl exec -it'
alias kd='kubectl describe'
alias kl='kubectl logs'

export ICONIK_ENV_NAME=achernar
export PATH=$PATH:/Users/achernar/Library/Python/3.8/bin:/Users/achernar/.local/bin
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

source virtualenvwrapper.sh

alias klocal="
	export KUBECONFIG=/Users/achernar/.kube/config; 
      	unset CLOUDSDK_CORE_PROJECT;
	tabset --badge 'local' --title 'kubeconfig-local' --color grey;
"
alias kdev="
        export KUBECONFIG=/Users/achernar/.kube/kubeconfig-achernar-iconik-dev;
        unset CLOUDSDK_CORE_PROJECT;
	tabset --badge 'dev' --title 'kubeconfig-achernar-iconik-dev' --color green;
"
alias kachernar-1="
	export KUBECONFIG=/Users/achernar/.kube/kubeconfig-achernar-cluster-1; 
      	gcloud container clusters get-credentials cluster-1 --zone europe-north1-a --project achernar; 
      	export CLOUDSDK_CORE_PROJECT=achernar; 
	tabset --badge 'achernar-cluster-1' --title 'kubeconfig-achernar-cluster-1' --color orange;
"
alias kiconik-test-eu="
        export KUBECONFIG=/Users/achernar/.kube/kubeconfig-iconik-test-eu;
	gcloud container clusters get-credentials iconik-test-eu --zone europe-north1-a --project iconik-test;
        export CLOUDSDK_CORE_PROJECT=iconik-test;
        tabset --badge 'iconik-test-eu' --title 'kubeconfig-iconik-test-eu' --color red;
"

###########################
### Achernar Section /\ ###
###########################

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/achernar/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/achernar/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/achernar/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/achernar/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/achernar/Applications/google-cloud-sdk/completion.zsh.inc'; fi


