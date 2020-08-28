# Homebrew to install various items, could pretty easily swap this for apt-get or something as necessary
brew install vim

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
python3 $HOME/.vim/bundle/YouCompleteMe/install.py --all
