" Plug plugins
call plug#begin('~/.vim/plugged')
	Plug 'preservim/nerdtree'
	Plug 'junegunn/vim-easy-align'
	Plug 'fladson/vim-kitty'
	Plug 'luochen1990/rainbow'
	Plug 'tpope/vim-surround'
	Plug 'vim-syntastic/syntastic'
	Plug 'vim-scripts/AutoComplPop'
call plug#end()

" Plug vim-easy-align settings
"" Visual mode
xmap ga <Plug>(EasyAlign)
"" Motion/text object
nmap ga <Plug>(EasyAlign)

"==>==<==>==<==>==<==>==<==>==<==Syntastic==>==<==>==<==>==<==>==<==>==<==>==<=

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"==>==<==>==<==>==<==>==<==>==<=!Syntastic!=>==<==>==<==>==<==>==<==>==<==>==<=

" Basic settings
syntax on
set ai si sw=4 ts=4
set mouse=a
set cc=80
set number

set cursorline
hi CursorLine gui=bold cterm=bold

" Auto completion
inoremap {<CR> {<CR>}<Esc>ko

" Netrw settings
let g:netrw_liststyle    = 3
let g:netrw_banner       = 1
let g:netrw_browse_split = 4
let g:netrw_winsize      = 25
let g:netrw_altv         = 1

fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun
autocmd BufWritePre * call TrimWhitespace()

" Autocompletion settings
set complete+=kspell,d
set completeopt=menuone,popup
set shortmess+=c

"==>==<==>==<==>==<==>==<==>==<==>==OPAM==<==>==<==>==<==>==<==>==<==>==<==>==<

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line

"==>==<==>==<==>==<==>==<==>==<==>=!OPAM!=<==>==<==>==<==>==<==>==<==>==<==>==<
