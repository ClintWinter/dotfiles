# Environment setup

Install `brew` (https://brew.sh/)

`brew install neovim tmux fnm`

Follow fnm instructions.

Clone [this project](https://github.com/ClintWinter/dotfiles) into `~/etc`.

`npm install -g typescript typescript-language-server @tailwindcss/language-server`

Add symlink to expected neovim config file: `ln -s ~/etc/vim/init.vim ~/.config/nvim/init.vim`

Do the normal `:so %` and `:PlugInstall`.
