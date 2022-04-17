"
" Key bindings
"
let mapleader = ' '

" Telescope
nmap <c-p> <cmd>Telescope git_files<cr>
nmap <c-p><c-p> <cmd>Telescope find_files<cr>
nmap <leader>b <cmd>Telescope buffers<cr>
nmap <leader>lg <cmd>Telescope live_grep<cr>
nmap <leader>fb <cmd>Telescope current_buffer_fuzzy_find<cr>

" Write
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>

"
" Top mappings via https://www.youtube.com/watch?v=hSHATqh8svM
"
" Make Y behave like C, and D (yank to end of line)
nnoremap Y y$

"
" PHP Actor
"
nnoremap <silent><leader>u :call phpactor#ImportClass()<cr>

"
" Plugins
"
nnoremap <buffer><nowait> <leader>pi <cmd>PlugInstall<cr>
nnoremap <buffer><nowait> <leader>pu <cmd>PlugUpdate<cr>

" Buffers
nmap <silent> <leader>bd :bd<cr>
nmap <silent> <leader>bda :bufdo bd<cr>

function! SourceryMappings()
  nmap <buffer> gp <Plug>SourceryGoToRelatedPluginDefinition
  nmap <buffer> gm <Plug>SourceryGoToRelatedMappings
  nmap <buffer> gc <Plug>SourceryGoToRelatedConfig
endfunction
