# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dracula"

plugins=(git)


source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# added by Anaconda2 4.1.0 installer
export CONDAPATH=($HOME/*conda*)
export PATH="$PATH:$CONDAPATH/bin"

hangups () {
docker run -it --rm --name hangups --volumes-from hangups-session tdryer/hangups
}

alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias pprint="python -m json.tool"
alias -g mountdev="sshfs nmarquez@cluster-dev.ihme.washington.edu:/ /mnt/cluster-dev"
alias -g umountdev="umount /mnt/cluster-dev"
alias vpnihmeup="nmcli con up id IHME"
alias vpnihmedown="nmcli con down id IHME"
alias wifirestart="service network-manager restart"
alias gittree="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --branches --date-order"
alias canihaz="sudo apt install"
alias digivolve="sudo apt update && sudo apt dist-upgrade"
alias ipy="ssh -N -f -L localhost:8000:localhost:7575"

# Setup the alias. Put this in your .bash_rc or .zshrc file so it's available at startup.
alias doodle="docker run -v $(pwd)/samples:/nd/samples -v $(pwd)/frames:/nd/frames -it alexjc/neural-doodle"
