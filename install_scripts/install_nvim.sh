# Neovim
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

# Neovim python package
sudo apt-get install python-dev python-pip python3-dev python3-pip
pip install --upgrade neovim
pip3 install --upgrade neovim

# vi/vim/editor open up neovim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

# xclip for clipboard
sudo apt-get install xclip

# Vim-plug
sudo apt-get install curl
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
