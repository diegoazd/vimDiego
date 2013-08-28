set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

call pathogen#infect()
call pathogen#incubate()
call pathogen#helptags()



" Empieza lo mio
function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction


colors darkblue
set number

set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
set nobackup
set foldmethod=syntax
set nofoldenable
set guioptions=mlrTb
set wrap!
set ruler
set history=200

:nmap <F3> :read !pwgen -cnB 8 1 <CR>
:nmap <f4> "=strftime("%c")<CR>P


cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

let g:vim_arduino_sketchbook='/home/hgmiguel/sketchbook/'
let g:vim_arduino_sdk_home='/usr/share/arduino/'
let g:vim_arduino_port='/dev/ttyUSB0'
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

filetype plugin on
set ofu=syntaxcomplete#Complete
runtime macros/matchit.vim

map <C-n> :NERDTreeToggle<CR>
set t_Co=256
set statusline=%F%m%r%h%w\ 
set statusline+=%{fugitive#statusline()}\    
set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
set statusline+=\ [line\ %l\/%L] 
command! W w
"Turn off the blinking cursor in normal mode:
"set gcr=n:blinkono
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

set wildignore+=*.class,.git,.hg,.svn,target/**

map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

map <leader>c :CommandT<CR>
map <leader>f :CommandTFlush<CR>

map <C-d> :NERDTreeToggle<CR>
set nobackup      
set nowritebackup 
set noswapfile
syntax enable
set background=dark
colorscheme solarized
let g:grails_import_search_path="~/source"
nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'c:class',
        \ 'i:interface',
        \ 'f:function',
        \ 'v:variables',
    \ ]
    \ }
