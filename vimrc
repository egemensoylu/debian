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


