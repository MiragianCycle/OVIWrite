"This points to the system clipboard, allowing users to copy and paste text from other parts of the sytem into vim. '''unamed''' and '''unnamedplus''' refer to system clipboards in Windows, MacOS and Linux. This also allows you to yank and CTRL V in other programs on all three platforms.

set clipboard^=unnamed, unnamedplus

set nocompatible

set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

" syntax highlight on. Useful when working with markdown, org-mode and vim-wiki
syntax on

" show line numbers
set nu
set relativenumber
set completeopt-=preview

" save as sudo
ca w!! w !sudo tee "%"
" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" The next two settings ensure that line breaks and wrap work how writers, not
" coders, prefer it

set wrap
set spell
set scrolloff=10

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too

let g:nv_search_paths = ['~/Documents' ]
let g:languagetool_server_jar="/home/user/languagetool/languagetool-commandline-2.2._jar"

"   This is a selection of plugins to make prose writing easier. 
"The first order of business is to initialize the Language tool with the below command

let g:languagetool_jar="/home/user/languagetool/languagetool-commandline-2.2.jar"

if !has('nvim')
  set viminfo+=n~/vim/viminfo
else
  " Do nothing here to use the neovim default
  " or do soemething like:
  " set viminfo+=n~/.shada
endif


let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif



highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

