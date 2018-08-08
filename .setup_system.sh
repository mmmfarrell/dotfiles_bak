
# Download git, clone this repo anywhere except your home dir

# Setup dot files
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'"
echo ".cfg" >> .gitignore
git clone --bare https://github.com/mmmfarrell/dotfiles.git $HOME/.cfg
# automatically move the files that will be changed to a backup
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
config checkout
config config --local status.showUntrackedFiles no

# Install the things you need
sudo apt-get -y install tmux vim-gtk-py2 fonts-powerline

# Install vim plugins
vim +PluginInstall +qall

# Install YouCompleteMe
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer

# All done
cd ~
echo Setup Complete

