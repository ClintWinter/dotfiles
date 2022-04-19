# Environment setup

Install `brew` (https://brew.sh/)

`brew install neovim tmux fnm`

Follow fnm instructions.

Clone [this project](https://github.com/ClintWinter/dotfiles) into `~/etc`.

`npm install -g typescript typescript-language-server @tailwindcss/language-server`

Add symlink to expected neovim config file: `ln -s ~/etc/vim/init.vim ~/.config/nvim/init.vim`

Do the normal `:so %` and `:PlugInstall`.

# ZSH

Install oh-my-zsh.

Install the plugins being used:
* [Git trim](https://github.com/jasonmccreary/git-trim#install-via-zsh)
* [zsh syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)
