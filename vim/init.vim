"
" Settings
"
set relativenumber          " use relative line numbers.
set nu                      " use actual line number for current number.
set nocompatible            " disable compatibility to old-time vi.
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching.
set mouse=v                 " middle-click paste with mouse.
set hlsearch                " highlight search results.
set autoindent              " indent a new line the same amount as the line just typed.
set wildmode=longest,list   " get bash-like tab completions.
set cc=120                  " set an 120 column border for good coding style.
filetype plugin indent on   " allows auto-indenting depending on file type.
set tabstop=4               " number of columns occupied by a tab character.
set expandtab               " converts tabs to white space.
set shiftwidth=4            " width for autoindents.
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing.
set guicursor=              " keep the block cursor even while in insert mode.
set nohlsearch              " remove the highlights on search matches after moving cursor.
set hidden                  " don't close files when they are switched away from. Keep their state. 
set noerrorbells            " Dont make ringy-dingy noises in my ears. 
set si                      " should indent next line? 
set tw=120                  " hard wrap at 120 characters 
set scrolloff=8             " keep the cursor buffered off the edge
set signcolumn=yes

"
" netrw settings
"
let g:netrw_banner=0                            " suppress banner
let g:netrw_liststyle=3                         " tree style
let g:netrw_list_hide=netrw_gitignore#Hide()    " use .gitignore

"
" Plugins
"
call plug#begin('~/.config/nvim/plugged')
    source ~/.dotfiles/vim/plugins.vim
call plug#end()

call sourcery#init()


syntax on
set background=dark
colorscheme carbon

set completeopt=menu,menuone,noselect

" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
