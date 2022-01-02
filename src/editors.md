---
title: "Editors: Vim and Emacs"
author: mathieu.fourre
logo: https://avatars.githubusercontent.com/u/96961500?s=200&v=4
---

# Why ?

You are soon going to experience la Piscine. It will be long and hard but
you will learn a lot. A lot of the piscine is redundent and you can lose a
lot of time doing the same thing over and over. This is why it is important
to `optimize` your workflow.

The first step on your path to optimization is your editor.

**Give up on VScode and other aberations**. Embrace the simplicity and efficiency
of `vim`.

# Vim or Emacs

This is your choice. You can learn either of them. However most people at EPITA
use `vim`. (If you are interested in `emacs` lookup `doom-emacs` and look for
the few assistance that use and love it. They will be happy to help you).

The most important thing is that your use as many features as possible of the
editor of your choice.

The following parts of this subject will be about `vim`.

# Setting up VIM

The first thing you need to know is how to configure Vim.

Look for a file called `.vimrc` in your `$HOME` folder.
You may not have any by default but you are still using the default `.vimrc`
setted by EPITA.


# PIE specific setup

As you aready know, only the `$HOME/afs` folder is preserved on the PIE.
This means that if your create a `$HOME/.vimrc` it will be lost after a reboot.
The soution is to create the file in `$HOME/afs/.config/` and then add the
name of the file in the special script in the same folder.

```sh
$ touch ~/afs/.config/vimrc # note that there is not point here
$ vim ~/afs/.config/install.sh
```

# An example of .vimrc (parts of mine)
```vim
" remove annoying beep
set belloff=all

" set encoding
set encoding=utf-8 fileencodings=

" enable syntax highlighting
syntax on

" Shows matching brackets
set showmatch 

" set visible trailing characters
set list listchars=tab:»\ ,trail:·

" if you really want to use the mouse
set mouse=a
set ttymouse=sgr " wide monitor mouse fix

" set numbers on the left
set number

" set line at 80 char
set cc=80

" indentation
filetype plugin indent on
set autoindent
set smartindent

" set tab size
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" custom shotcuts
let mapleader="\<Space>"
nnoremap <Space> <nop>
nnoremap <Leader>f :Explore<CR>
nnoremap <Leader>w :w<CR>

" c braces setup
inoremap {<CR> {<CR>}<Esc>ko

" reduce latency when escaping
set ttimeoutlen=10

" makefiles settings
autocmd Filetype make setlocal noexpandtab

" c files
autocmd BufRead,BufNewFile *.c,*.h setlocal cinoptions+=:0 " case statement indent fix
autocmd BufRead,BufNewFile *.c,*.h setlocal comments=s:/**,mb:**,ex:*/,s:/*,mb:**,ex:*/

packadd termdebug
```

# Our `.vimrc`s ...
- [mathieu.fourre](https://github.com/mthfrr/config/blob/master/.vimrc)
- [timothee.denizou](https://github.com/tim-tim707/dotfiles/blob/master/.vimrc)
- [raphael.duhen]("https://github.com/ASM-2024/jour1/blob/master/docs/raphael.duhen.vimrc")
