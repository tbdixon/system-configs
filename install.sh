# Manually run these first, keeping here for simplicity. 
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# brew install python
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# move files to their final spot and source them
cp .alias.sh $HOME
cp .bashrc $HOME
source $HOME/.bashrc
source $HOME/.alias.sh
cp .vimrc $HOME

# vim plugin setup
rm -rf $HOME/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
