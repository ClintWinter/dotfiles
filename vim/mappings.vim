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

function! SourceryMappings()
  nmap <buffer> gp <Plug>SourceryGoToRelatedPluginDefinition
  nmap <buffer> gm <Plug>SourceryGoToRelatedMappings
  nmap <buffer> gc <Plug>SourceryGoToRelatedConfig
endfunction
