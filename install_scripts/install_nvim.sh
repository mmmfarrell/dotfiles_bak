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

###### Plugins #####
# Vim-plug
sudo apt-get install curl
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# xclip for clipboard
sudo apt-get install xclip

# powerline fonts
sudo apt-get install fonts-powerline

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
