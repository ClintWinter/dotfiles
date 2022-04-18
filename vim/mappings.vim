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
" nmap <c-j> <c-w><c-j>
" nmap <c-k> <c-w><c-k>
" nmap <c-h> <c-w><c-h>
" nmap <c-l> <c-w><c-l>
"

" Plugins
nnoremap <buffer><nowait> <leader>pi <cmd>PlugInstall<cr>
nnoremap <buffer><nowait> <leader>pu <cmd>PlugUpdate<cr>


" Mappings: lsp
nnoremap <silent> <leader>la <cmd>lua require'telescope.builtin'.lsp_code_actions()<cr>
nnoremap <silent> <leader>ld <cmd>lua require'telescope.builtin'.lsp_definitions{}<cr>
nnoremap <silent> <leader>lt <cmd>lua require'telescope.builtin'.lsp_type_definitions{}<cr>
nnoremap <silent> <leader>li <cmd>lua require'telescope.builtin'.lsp_implementations{}<cr>
nnoremap <silent> <leader>lr <cmd>lua require'telescope.builtin'.lsp_references{}<cr>
nnoremap <silent> <leader>ls <cmd>lua require'telescope.builtin'.lsp_document_symbols{}<cr>
nnoremap <silent> <leader>lm <cmd>lua require'telescope.builtin'.lsp_document_symbols{symbols="method"}<cr>


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


" Mappings: test
nmap <silent> <leader>tn :w<cr>:TestNearest<cr>
nmap <silent> <leader>tf :w<cr>:TestFile<cr>
nmap <silent> <leader>ts :w<cr>:TestSuite<cr>
nmap <silent> <leader>tl :w<cr>:TestLast<cr>
nmap <silent> <leader>tv :w<cr>:TestVisit<cr>


function! SourceryMappings()
  nmap <buffer> gp <Plug>SourceryGoToRelatedPluginDefinition
  nmap <buffer> gm <Plug>SourceryGoToRelatedMappings
  nmap <buffer> gc <Plug>SourceryGoToRelatedConfig
endfunction
