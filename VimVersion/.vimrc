set clipboard=unnamedplus



" Fisa-vim-config
" http://fisadev.github.io/fisa-vim-config/
" version: 8.3.1

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.vim/plugged')

" main one
" Vim-plug
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'psliwka/vim-smoothie'
Plug 'skanehira/preview-markdown.vim'
Plug 'mattn/calendar-vim'
Plug 'vigoux/LanguageTool.nvim'
"Plug 'inkarkat/vim-SyntaxRange'
" 9000+ Snippets
"Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
"Plug 'ervandew/supertab' 
"Plug 'nvie/vim-flake8'
"Plug 'tmhedberg/SimpylFold'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim' " :GV
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'tell-k/vim-autopep8'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'rajasegar/vim-search-web'
Plug 'voldikss/vim-floaterm'
map <leader>f :FloatermToggle <CR>
"Plug 'turbio/bracey.vim'
Plug 'vimwiki/vimwiki'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'chipsenkbeil/vimwiki-server.nvim', { 'tag': 'v0.1.0-alpha.5' }
Plug 'Pocco81/HighStr.nvim'
"Plug 'maxmellon/vim-jsx-pretty'
Plug 'jceb/vim-orgmode'
Plug 'sbdchd/neoformat'
Plug 'nvim-neorg/neorg' 
"Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
"Plug 'RishabhRD/popfix'
"Plug 'RishabhRD/nvim-cheat.sh'
"Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
"Plug 'metakirby5/codi.vim'
Plug 'kristijanhusak/orgmode.nvim'
Plug 'vigoux/LanguageTool.nvim'
Plug 'junegunn/fzf.vim'
Plug 'michal-h21/vim-zettel'
Plug 'https://github.com/alok/notational-fzf-vim'
let g:nv_search_paths = ['~/Documents' ]
Plug 'matze/vim-move' 
Plug 'iamcco/markdown-preview.nvim' 
Plug 'ggandor/lightspeed.nvim'
"   This is a selection of plugins to make prose writing easier. 

Plug 'dpelle/vim-LanguageTool' 
let g:languagetool_jar="/home/theena/languagetool/languagetool-commandline-2.2.jar"
"Plug 'rhysd/vim-grammarous.vim'
Plug 'ron89/thesaurus_query.vim' 
Plug 'junegunn/goyo.vim' 
Plug 'junegunn/limelight.vim' 
Plug 'reedes/vim-pencil' 
Plug 'reedes/vim-wordy'
Plug 'plasticboy/vim-markdown'
Plug 'mhinz/vim-startify'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'kblin/vim-fountain'
"This is for Latex support
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"This begins snippets"
"
"Plug 'neovim/nvim-lspconfig'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
"Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'
"
" " For luasnip users.
" " Plug 'L3MON4D3/LuaSnip'
" " Plug 'saadparwaiz1/cmp_luasnip'
"
"" For ultisnips users.
" Plug 'SirVer/ultisnips'
" " Plug 'quangnguyen30192/cmp-nvim-ultisnips'
"
" " For snippy users.
" " Plug 'dcampos/nvim-snippy'
" " Plug 'dcampos/cmp-snippy'
"
"call plug#end()
"
"set completeopt=menu,menuone,noselect
"
"lua <<EOF
"  -- Setup nvim-cmp.
"    local cmp = require'cmp'
"
"      cmp.setup({
"          snippet = {
"                -- REQUIRED - you must specify a snippet engine
"                      expand = function(args)
"                              vim.fn["vsnip#anonymous"](args.body) -- For
"                              `vsnip` users.
"                                      --
"                                      require('luasnip').lsp_expand(args.body)
"                                      -- For `luasnip` users.
"                                              --
"                                              require('snippy').expand_snippet(args.body)
"                                              -- For `snippy` users.
"                                                      --
"                                                      vim.fn["UltiSnips#Anon"](args.body)
"                                                      -- For `ultisnips`
"                                                      users.
"                                                            end,
"                                                                },
"                                                                    mapping =
"                                                                    {
"                                                                          ['<C-b>']
"                                                                          =
"                                                                          cmp.mapping(cmp.mapping.scroll_docs(-4),
"                                                                          {
"                                                                          'i',
"                                                                          'c'
"                                                                          }),
"                                                                                ['<C-f>']
"                                                                                =
"                                                                                cmp.mapping(cmp.mapping.scroll_docs(4),
"                                                                                {
"                                                                                'i',
"                                                                                'c'
"                                                                                }),
"                                                                                      ['<C-Space>']
"                                                                                      =
"                                                                                      cmp.mapping(cmp.mapping.complete(),
"                                                                                      {
"                                                                                      'i',
"                                                                                      'c'
"                                                                                      }),
"                                                                                            ['<C-y>']
"                                                                                            =
"                                                                                            cmp.config.disable,
"                                                                                            --
"                                                                                            Specify
"                                                                                            `cmp.config.disable`
"                                                                                            if
"                                                                                            you
"                                                                                            want
"                                                                                            to
"                                                                                            remove
"                                                                                            the
"                                                                                            default
"                                                                                            `<C-y>`
"                                                                                            mapping.
"                                                                                                  ['<C-e>']
"                                                                                                  =
"                                                                                                  cmp.mapping({
"                                                                                                          i = cmp.mapping.abort(),
"                                                                                                                  c
"                                                                                                                  =
"                                                                                                                  cmp.mapping.close(),
"                                                                                                                        }),
"                                                                                                                              ['<CR>']
"                                                                                                                              =
"                                                                                                                              cmp.mapping.confirm({
"                                                                                                                              select
"                                                                                                                              =
"                                                                                                                              true
"                                                                                                                              }),
"                                                                                                                              --
"                                                                                                                              Accept
"                                                                                                                              currently
"                                                                                                                              selected
"                                                                                                                              item.
"                                                                                                                              Set
"                                                                                                                              `select`
"                                                                                                                              to
"                                                                                                                              `false`
"                                                                                                                              to
"                                                                                                                              only
"                                                                                                                              confirm
"                                                                                                                              explicitly
"                                                                                                                              selected
"                                                                                                                              items.
"                                                                                                                                  },
"                                                                                                                                      sources
"                                                                                                                                      =
"                                                                                                                                      cmp.config.sources({
"                                                                                                                                            { name = 'nvim_lsp'  },
"                                                                                                                                                  {
"                                                                                                                                                  name
"                                                                                                                                                  =
"                                                                                                                                                  'vsnip'
"                                                                                                                                                  },
"                                                                                                                                                  --
"                                                                                                                                                  For
"                                                                                                                                                  vsnip
"                                                                                                                                                  users.
"                                                                                                                                                        --
"                                                                                                                                                        {
"                                                                                                                                                        name
"                                                                                                                                                        =
"                                                                                                                                                        'luasnip'
"                                                                                                                                                        },
"                                                                                                                                                        --
"                                                                                                                                                        For
"                                                                                                                                                        luasnip
"                                                                                                                                                        users.
"                                                                                                                                                              --
"                                                                                                                                                              {
"                                                                                                                                                              name
"                                                                                                                                                              =
"                                                                                                                                                              'ultisnips'
"                                                                                                                                                              },
"                                                                                                                                                              --
"                                                                                                                                                              For
"                                                                                                                                                              ultisnips
"                                                                                                                                                              users.
"                                                                                                                                                                    --
"                                                                                                                                                                    {
"                                                                                                                                                                    name
"                                                                                                                                                                    =
"                                                                                                                                                                    'snippy'
"                                                                                                                                                                    },
"                                                                                                                                                                    --
"                                                                                                                                                                    For
"                                                                                                                                                                    snippy
"                                                                                                                                                                    users.
"                                                                                                                                                                        },
"                                                                                                                                                                        {
"                                                                                                                                                                              { name = 'buffer'  },
"                                                                                                                                                                                  })
"                                                                                                                                                                                    })
"
"                                                                                                                                                                                      --
"                                                                                                                                                                                      Use
"                                                                                                                                                                                      buffer
"                                                                                                                                                                                      source
"                                                                                                                                                                                      for
"                                                                                                                                                                                      `/`
"                                                                                                                                                                                      (if
"                                                                                                                                                                                      you
"                                                                                                                                                                                      enabled
"                                                                                                                                                                                      `native_menu`,
"                                                                                                                                                                                      this
"                                                                                                                                                                                      won't
"                                                                                                                                                                                      work
"                                                                                                                                                                                      anymore).
"                                                                                                                                                                                        cmp.setup.cmdline('/',
"                                                                                                                                                                                        {
"                                                                                                                                                                                            sources = {
"                                                                                                                                                                                                  { name = 'buffer'  }
"                                                                                                                                                                                                      }
"                                                                                                                                                                                                        })
"
"                                                                                                                                                                                                          --
"                                                                                                                                                                                                          Use
"                                                                                                                                                                                                          cmdline
"                                                                                                                                                                                                          &
"                                                                                                                                                                                                          path
"                                                                                                                                                                                                          source
"                                                                                                                                                                                                          for
"                                                                                                                                                                                                          ':'
"                                                                                                                                                                                                          (if
"                                                                                                                                                                                                          you
"                                                                                                                                                                                                          enabled
"                                                                                                                                                                                                          `native_menu`,
"                                                                                                                                                                                                          this
"                                                                                                                                                                                                          won't
"                                                                                                                                                                                                          work
"                                                                                                                                                                                                          anymore).
"                                                                                                                                                                                                            cmp.setup.cmdline(':',
"                                                                                                                                                                                                            {
"                                                                                                                                                                                                                sources = cmp.config.sources({
"                                                                                                                                                                                                                      { name = 'path'  }
"                                                                                                                                                                                                                          },
"                                                                                                                                                                                                                          {
"                                                                                                                                                                                                                                { name = 'cmdline'  }
"                                                                                                                                                                                                                                    })
"                                                                                                                                                                                                                                      })
"
"                                                                                                                                                                                                                                        --
"                                                                                                                                                                                                                                        Setup
"                                                                                                                                                                                                                                        lspconfig.
"                                                                                                                                                                                                                                          local
"                                                                                                                                                                                                                                          capabilities
"                                                                                                                                                                                                                                          =
"                                                                                                                                                                                                                                          require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
"                                                                                                                                                                                                                                            --
"                                                                                                                                                                                                                                            Replace
"                                                                                                                                                                                                                                            <YOUR_LSP_SERVER>
"                                                                                                                                                                                                                                            with
"                                                                                                                                                                                                                                            each
"                                                                                                                                                                                                                                            lsp
"                                                                                                                                                                                                                                            server
"                                                                                                                                                                                                                                            you've
"                                                                                                                                                                                                                                            enabled.
"                                                                                                                                                                                                                                              require('lspconfig')['<YOUR_LSP_SERVER>'].setup
"                                                                                                                                                                                                                                              {
"                                                                                                                                                                                                                                                  capabilities = capabilities
"                                                                                                                                                                                                                                                    }
"                                                                                                                                                                                                                                                    EOF
"                                                                                                                                                                                                                                                    ``````
"                                                                                                                                                                                                                                              }
"                                                                                                                                                                                                                          }
"                                                                                                                                                                                                                })
"                                                                                                                                                                                                            })
"                                                                                                                                                                                            }
"                                                                                                                                                                                        })
"                                                                                                                                                                        }
"                                                                                                                                      })
"                                                                                                  })
"                                                                    }
"          }
"      })
" "
" "





let mapleader = " " "
map <leader>c :close <CR>



Plug 'thaerkh/vim-workspace'

"Related to above, the following code saves all session files in a single directory outside your
"workspace

let g:workspace_session_directory = $HOME . '/.vim/sessions/'

"You motherfucking compete me 
" Track the engine.
"Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"










"This is for Goyo Integration
map <leader>g :Goyo <CR>

map <leader>s :wa! <CR>
map <leader>5 :source% <CR>
map <leader>q  :qa!  <CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1





















" This section is to ensure that there is no conflict between vim and Nvim 
" which has to do with a conflict in variables in a shared file (https://vi.stackexchange.com/questions/10028/e576-failed-to-parse-shada-file-extra-bytes-in-msgpack-string-at-position-3)

if !has('nvim')
  set viminfo+=n~/vim/viminfo
else
  " Do nothing here to use the neovim default
  " or do soemething like:
  " set viminfo+=n~/.shada
endif







 " beautify the code:
map <F12> :Autopep8<CR>

" Plugins from github repos:


" Override configs by directory 
"Plug 'arielrossanigo/dir-configs-override.vim'
" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Class/module browser
"Plug 'majutsushi/tagbar'
" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Plug 'fisadev/vim-ctrlp-cmdpalette'
" Zen coding
"Plug 'mattn/emmet-vim'
" Git integration
Plug 'motemen/git-vim'
"" Tab list panel
Plug 'kien/tabman.vim'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Terminal Vim with 256 colors colorscheme
Plug 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
"Plug 'rosenfeld/conque-term'
" Pending tasks list
"Plug 'fisadev/FixedTaskList.vim'
" Surround
"Plug 'tpope/vim-surround'
" Autoclose
Plug 'Townk/vim-autoclose'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'
" Python autocompletion, go to definition.
"Plug 'davidhalter/jedi-vim'
" Better autocompletion
 "Plug 'Shougo/neocomplcache.vim'
" Snippets manager (SnipMate), dependencies, and snippets repo
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'honza/vim-snippets'
"Plug 'garbas/vim-snipmate'
" Git/mercurial/others diff icons on the side of the file lines
"Plug 'mhinz/vim-signify'
" Automatically sort python imports
"Plug 'fisadev/vim-isort'
" Drag visual blocks arround
Plug 'fisadev/dragvisuals.vim'
" Window chooser
"Plug 't9md/vim-choosewin'
" Python and other languages code checker
"Plug 'scrooloose/syntastic'
" Paint css colors with the real color
"Plug 'lilydjwg/colorizer'
" Ack code search (requires ack installed in the system)
Plug 'mileszs/ack.vim'
if has('python')
    " YAPF formatter for Python
    Plug 'pignacio/vim-yapf-format'
endif
" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative 
" numbering every time you go to normal mode. Author refuses to add a setting 
" to avoid that)
" Plug 'myusuf3/numbers.vim'

" Plugins from vim-scripts repos:

" Search results counter
Plug 'vim-scripts/IndexedSearch'
" XML/HTML tags navigation
Plug 'vim-scripts/matchit.zip'
" Gvim colorscheme
Plug 'vim-scripts/Wombat'
" Yank history navigation
Plug 'vim-scripts/YankRing.vim'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" no vi-compatible
set nocompatible

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on
au BufRead,BufNewFile *.fountain set filetype=fountain

" The next two settings ensure that line breaks and wrap work how writers, not
" coders, prefer it

set wrap
set spell
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
map <leader>c :close <CR>
map <leader>pi :PlugInstall <CR>
map <leader>ps :PlugStatus <CR>
" Enable autocompletion from neocomplcache

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2

" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch
map <leader>nhl :nohlsearch<CR>


" syntax highlight on
syntax on

" show line numbers
set nu
set relativenumber
map <leader>n :set nu rnu cursorline<CR>


" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
set completeopt-=preview

" save as sudo
ca w!! w !sudo tee "%"

" simple recursive grep
nmap ,r :Ack 
nmap ,wr :Ack <cword><CR>

" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
	let &t_Co = 256
    colorscheme gruvbox  
else
    colorscheme gruvbox   
endif

" colors for gvim
if has('gui_running')
    colorscheme gruvbox
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=5

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

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar ----------------------------- 

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree ----------------------------- 

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap <Space>t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.docx$']
map <leader>t :NERDTreeToggle<CR>


" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>

" CtrlP ------------------------------

" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Syntastic ------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_style_warning_symbol = '⚠'

" Jedi-vim ------------------------------

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" NeoComplCache ------------------------------

" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make 
" it play nice)
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

" TabMan ------------------------------

" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" DragVisuals ------------------------------

" mappings to move blocks in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'gruvbox'
let g:airline#extensions#whitespace#enabled = 0

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
"if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
"endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

" start with Insert on:
"au BufRead,BufNewFile * startinsert

" supertab settings
set completeopt=longest,menuone
let g:SuperTabDefaultCompletionType = "<c-n>"

" emmet settings 
let g:user_emmet_leader_key='<Space>'
"use { 'vim-ctrlspace/vim-ctrlspace' }

