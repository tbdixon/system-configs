# Homebrew to install various items, could pretty easily swap this for apt-get or something as necessary
brew install neovim
python3 -m pip install --user --upgrade pynvim

# move files to their final spot and source them
cp .alias.sh $HOME
cp .bashrc $HOME
source $HOME/.bashrc

cp .vimrc $HOME
rm -rf $HOME/.config/nvim
mkdir $HOME/.config/nvim
echo "source $HOME/.vimrc" > $HOME/.config/nvim/init.vim
echo "let g:python3_host_prog = '/usr/local/bin/python3'" >> $HOME/.config/nvim/init.vim

# vim plugin setup
rm -rf $HOME/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
python3 $HOME/.vim/bundle/YouCompleteMe/install.py --all
