# Set PATH, MANPATH, etc., for Homebrew.
# Set PATH, MANPATH, etc., for Homebrew.
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

alias k=kubectl
alias stsid=aws sts get-caller-identity | cat

alias ksh_infra=yle kubeshell asdf


export TF_AWS_ROLE=ops
export GITHUB_TOKEN=$(security find-generic-password -a "jarnovirtanen" -s "githubpat" -w)
export PATH=$PATH:/Users/jarnovirtanen/bin
export DOCKER_CLI_HINTS=false
export YLE_AWS_TOOLS_TMP_DIR=/Users/jarnovirtanen/.yle-aws-tools


if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon)
fi


