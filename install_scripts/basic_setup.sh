
# Download git, clone this repo anywhere except your home dir

# Setup dot files
git clone --bare https://github.com/mmmfarrell/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

## Install the things you need
#sudo apt-get -y install tmux vim-gtk3-py2 fonts-powerline
#sudo update-alternatives --set vim /usr/bin/vim.gtk3-py2
#sudo update-alternatives --set vi /usr/bin/vim.gtk3-py2

## Install vim plugins
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#vim +PluginInstall +qall

## Install YouCompleteMe
#sudo apt-get install -y build-essential cmake
#sudo apt-get install -y python-dev python3-dev
#cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer

# All done
cd ~
echo Setup Complete

