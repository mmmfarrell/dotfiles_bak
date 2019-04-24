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
sudo apt install -y vim tmux curl silversearcher-ag
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -E -s -u "~/.vimrc" +PlugInstall +qall

# Install gnome tweak
# gnome-tweaks
# Additional Layout Options -> Caps Lock beahvior -> Caps Lock is also a Ctrl
