let mapleader = ' '


" Write
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>


" Top mappings via https://www.youtube.com/watch?v=hSHATqh8svM
" Make Y behave like C, and D (yank to end of line)
nnoremap Y y$


" Buffers
nmap <silent> <leader>bdc :bd<cr>
nmap <silent> <leader>bda :bufdo bd<cr>

" Window navigation
nmap <c-j> <c-w><c-j>
nmap <c-k> <c-w><c-k>
nmap <c-h> <c-w><c-h>
nmap <c-l> <c-w><c-l>

" Plugins
nnoremap <buffer><nowait> <leader>pi <cmd>PlugInstall<cr>
nnoremap <buffer><nowait> <leader>pu <cmd>PlugUpdate<cr>


" Mappings: Telescope
nmap <c-p> <cmd>Telescope git_files<cr>
nmap <c-p><c-p> <cmd>Telescope find_files<cr>
nmap <leader>bl <cmd>Telescope buffers<cr>
nmap <leader>lg <cmd>Telescope live_grep<cr>
nmap <leader>fb <cmd>Telescope current_buffer_fuzzy_find<cr>


" Mappings: phpactor
nnoremap <silent><leader>u :call phpactor#ImportClass()<cr>


" Mappings: fugitive
nmap <leader>gd :Gdiff<cr>


function! SourceryMappings()
  nmap <buffer> gp <Plug>SourceryGoToRelatedPluginDefinition
  nmap <buffer> gm <Plug>SourceryGoToRelatedMappings
  nmap <buffer> gc <Plug>SourceryGoToRelatedConfig
endfunction
