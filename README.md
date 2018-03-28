# dotfiles
dotfiles I use for my setup of Ubuntu 16.04. Others may find these useful for reference for config files for the following:
- bash
- vim
- tmux
- git
- ROS

The method used to create the git repository and manage them was adapted from this [blog post](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

To install these dotfiles onto your current machine follow these steps:

1. Place the following alias into your bash and source your bash
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

2. Avoid recursion problems with:
```
echo ".cfg" >> .gitignore
```

3. Clone the repository into .cfg:
```
git clone --bare https://github.com/mmmfarrell/dotfiles.git $HOME/.cfg
```

4. Checkout the content into your $HOME directory:
```
config checkout
```

5. Remove the overlapping files from your current $HOME directory or automatically place them in a backup folder with
```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

6. Recheckout the files and everything should be there!
```
config checkout
```

7. Make sure to set the local variable of this git repo to not show untrackedFiles so that `config status` doesn't show crazy cluttered results.
```
config config --local status.showUntrackedFiles no
```

All of these steps can be bundled into a bash script (see the blog post)
