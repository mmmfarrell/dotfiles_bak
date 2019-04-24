# To install dotfiles from mmmfarrell (thats me :))
git clone --bare https://github.com/mmmfarrell/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p $HOME/.config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv $HOME/{} $HOME/.config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

# Other cool stuff for my setup
sudo apt remove -y vim*
sudo apt install -y vim-gtk tmux curl silversearcher-ag
sudo apt install -y python-pip cmake htop
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -E -s -u "~/.vimrc" +PlugInstall +qall

# Install gnome tweak
# gnome-tweaks
# Additional Layout Options -> Caps Lock beahvior -> Caps Lock is also a Ctrl

# Stuff to make VIM nice
# powerline fonts
sudo apt install -y fonts-powerline

# LSP
# Python pyls
pip install python-language-server

# C/C++ cquery
mkdir -p ~/installed_apps
cd ~/installed_apps
git clone --recursive https://github.com/cquery-project/cquery.git
cd cquery
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/mmmfarrell/.local/ -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
cmake --build .
cmake --build . --target install

# Latex
sudo apt install -y texlive-full zathura xdotool


echo Config Done!

