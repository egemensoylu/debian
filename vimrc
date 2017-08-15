" dEbian system-wide default configuration Vim

set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

" Now we set some defaults for the editor
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" modelines have historically been a source of security/resource
" vulnerabilities -- disable by default, even when 'nocompatible' is set
set nomodeline

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Some Debian-specific things
if has("autocmd")
  if has('gui')
    " Make shift-insert work like in Xterm
    autocmd GUIEnter * if empty(maparg("<S-Insert>", "nvso")) | execute "map <S-Insert> <MiddleMouse>" | endif
    autocmd GUIEnter * if empty(maparg("<S-Insert>", "ic")) | execute "map! <S-Insert> <MiddleMouse>" | endif
  endif
endif

" Set paper size from /etc/papersize if available (Debian-specific)
if filereadable("/etc/papersize")
  let s:papersize = matchstr(readfile('/etc/papersize', '', 1), '\p*')
  if strlen(s:papersize)
    exe "set printoptions+=paper:" . s:papersize
  endif
endif



colorscheme industry
syntax on
set sw=4
set ts=4
set sts=4
execute pathogen#infect()
filetype plugin indent on

map <silent> <C-n> :NERDTreeFocus<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>


set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set mouse=a
" "press <Enter> to continue"
set cmdheight=2
set relativenumber
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>



let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1





set t_Co=256

"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif

" unicode symbols
let g:airline_left_sep = '»'
"let g:airline_left_sep = '|'
let g:airline_right_sep = '«'
"let g:airline_right_sep = '|'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"
" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''


set ttimeoutlen=50



set winheight=30
set winminheight=5
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>


