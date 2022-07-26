#!/bin/bash

dry_run=false

while getopts 'hn' opt; do
    case "$opt" in
        n) dry_run=true ;;
        h|*) echo "usage $0 [flags]" >&2
           echo '  -n dry-run' >&2
           echo '  -h help' >&2
           exit 1 ;;
    esac
done

if "$dry_run"; then
    cmd=echo
else
    cmd=''
fi

echo "Installing homebrew..."
$cmd /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Installing homebrew...done"

echo "Installing tools using brew command..."
$cmd brew install ansible bento4 ffmpeg ghostscript git helm imagemagick jq k9s kubernetes-cli nvm pipenv pipx poppler powerlevel10k pulumi python@3.10 python@3.9 telnet terraform ufraw virtualenv virtualenvwrapper watch
echo "Installing tools using brew command...done"

echo "Installing node v18 and npm global packages..."
$cmd nvm install 18
$cmd npm install -g iterm2-tab-set
echo "Installing node v18 and npm global packages...done"

read -e -p "Public key [~/.ssh/achernar.pub]: " PUBKEY_FILEPATH
PUBKEY_FILEPATH=${PUBKEY_FILEPATH:-~/.ssh/achernar.pub}
[ -f $PUBKEY_FILEPATH ] && echo "Public key $PUBKEY_FILEPATH exists." || { echo "Public key $PUBKEY_FILEPATH does not exist." && exit 1 ;}
read -e -p "Private key [~/.ssh/achernar]: " PRIVKEY_FILEPATH
PRIVKEY_FILEPATH=${PRIVKEY_FILEPATH:-~/.ssh/achernar}
[ -f $PRIVKEY_FILEPATH ] && echo "Private key $PRIVKEY_FILEPATH exists." || { echo "Private key $PRIVKEY_FILEPATH does not exist." && exit 1 ;}

WORKING_DIR=/tmp/achernar
$cmd mkdir -p $WORKING_DIR
$cmd git clone git@github.com:achernar-iconik/laptop-config.git $WORKING_DIR 
$cmd mv $WORKING_DIR/config ~/.ssh/
$cmd mv $WORKING_DIR/.p10k.zsh ~/
$cmd mv $WORKING_DIR/.zshrc ~/
$cmd rm -rf /tmp/achernar
