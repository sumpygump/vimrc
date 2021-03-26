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

echo "----------------"

symlink_with_checks() {
    sourcepath="$1"
    targetname="$2"
    if [ -e "$targetname" ]; then
        warn "Not symlinking $targetname; already exists"
    else
        ln -s "$sourcepath" "$targetname"
    fi
}

# Symlink ~/.vim and ~/.vimrc
cd ~
symlink_with_checks "$INSTALL_TO/vimrc/vim/vimrc" .vimrc
symlink_with_checks "$INSTALL_TO/vimrc/vim" .vim
touch ~/.vim/user.vim

echo "----------------"

# Plug Install
## Detect if installed version of vim will work
vim --version | grep "\+syntax" > /dev/null
if [ $? -eq 0 ]; then
    vim +PlugInstall +qall
else
    echo "NOTE: installed version of vim doesn't support plugins"
    echo "Skipped install of plugins"
    echo "Perhaps upgrade vim (apt install vim)"
    echo "And then run this:"
    echo "vim +PlugInstall +qall"
fi

echo "----------------"

echo "You should run this:"
echo "sudo apt install exuberant-ctags"
echo

echo "Installed and configured .vim, have fun."
