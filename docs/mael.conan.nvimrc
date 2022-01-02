call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-clangx'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'scrooloose/nerdTree'
Plug 'bling/vim-airline'
Plug 'dense-analysis/ale'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:deoplete#enable_at_startup = 1

let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
\}

" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

call deoplete#custom#source('_', 'max_menu_width', 80)
call deoplete#custom#option('ignore_sources', {'_': ['around', 'buffer']})

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

nmap <C-n> :NERDTreeToggle<CR>

set number
set cc=80
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

"Color change
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_italic_comments = 1
let g:nord_italic = 1
let g:nord_bold = 0
let g:nord_underline = 1
augroup nord-theme-overrides
  autocmd!
  " Use 'nord7' as foreground color for Vim comment titles.
  autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB
augroup END
colorscheme nord

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:airline#extensions#tabline#enabled = 1
