#!/bin/sh
INSTALL_TO=~

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$INSTALL_TO/vimrc" ] && die "$INSTALL_TO/vimrc already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

cd "$INSTALL_TO"
git clone git://github.com/sumpygump/vimrc.git
cd vimrc

# Symlink ~/.vim and ~/.vimrc
cd ~
ln -s "$INSTALL_TO/vimrc/vim/vimrc" .vimrc
ln -s "$INSTALL_TO/vimrc/vim" .vim
touch ~/.vim/user.vim

echo "You should run this:"
echo "sudo apt-get install exuberant-ctags"

echo "Installed and configured .vim, have fun."
