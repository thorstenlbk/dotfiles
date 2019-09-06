" Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if &compatible
    set nocompatible
endif

" Automatically install the plugin manager if missing

" Load plugins
call plug#begin('~/.vim/plugged')

" CTags manager
Plug 'ludovicchabant/vim-gutentags'

" display the result when searching
Plug 'henrik/vim-indexed-search'

" syntax highlighting for tmux.conf + other cool options
Plug 'tmux-plugins/vim-tmux' | Plug 'tmux-plugins/vim-tmux-focus-events'

" seemless navigation between vim windows / tmux pane
Plug 'christoomey/vim-tmux-navigator'

" wrapper for git and display git diff in the left gutter
Plug 'tpope/vim-fugitive' | Plug 'mhinz/vim-signify' 
" fugitive for the hub
" Plug 'tpope/vim-rhubarb'
" Display commits for project / file
Plug 'junegunn/gv.vim'

" surrounding text objects with whatever you want (paranthesis, quotes, html tags...)
Plug 'tpope/vim-surround'

" easily search, substitute and abbreviate multiple version of words
Plug 'tpope/vim-abolish'

" the . command can repeat whatever you want!
" http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
Plug 'tpope/vim-repeat'

" keystroke to comment automatically depending on the file you're in
Plug 'tpope/vim-commentary'

" Highlight briefly every yank text
Plug 'machakann/vim-highlightedyank'

" Autoclose with matching counterpart
Plug 'jiangmiao/auto-pairs'

" swap arguments in parenthesis
Plug 'machakann/vim-swap'

" add new text object (can delete between comma with di, for example)
Plug 'wellle/targets.vim'

" camel case motion
" Plug 'chaoren/vim-wordmotion'

" colors for i3 config file
Plug 'PotatoesMaster/i3-vim-syntax'

" Match more stuff with % (html tag, LaTeX...)
Plug 'andymass/vim-matchup'

" vim project for one specific vimrc / project + startify for startup cow
Plug 'amiorin/vim-project'
Plug 'mhinz/vim-startify'

" Asynchronous linting for every languages
" Plug 'neomake/neomake'

" snippet engine + snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Align plugin
Plug 'godlygeek/tabular'

" nginx syntax colors
Plug 'chr4/nginx.vim'

" Asynchronous linter
Plug 'dense-analysis/ale'

" php
" Syntax colors
Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.7'  } 
" Plug 'joonty/vdebug'
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
Plug 'nishigori/vim-php-dictionary', {'for': 'php'}

" php refactoring options
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug '2072/php-indenting-for-vim', {'for': 'php'}

" php doc autocompletion
Plug 'tobyS/vmustache' | Plug 'tobyS/pdv', {'for': 'php'}

" autocompletion
Plug 'ncm2/ncm2', {'for': 'php'}
" Plug 'roxma/nvim-yarp', {'for': 'php'}
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-tmux'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-github'
" Plug 'ncm2/ncm2-ultisnips', {'for': 'php'}
" Plug 'phpactor/ncm2-phpactor', {'for': 'php'}
" Plug 'ncm2/ncm2-go'
" Plug 'ncm2/ncm2-tern'
" Plug 'ncm2/ncm2-cssomni'
" Plug 'fgrsnau/ncm2-otherbuf', { 'branch': 'ncm2' }

" twig
Plug 'nelsyeung/twig.vim', {'for': 'twig'}

" javascript plugins
Plug 'pangloss/vim-javascript'

Plug 'leafgarland/typescript-vim'

" For react
Plug 'mxw/vim-jsx'

" For Vue
Plug 'posva/vim-vue'

" outliner
Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'

" Nerdtree + modifications 
" Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind']}
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" status bar
Plug 'itchyny/lightline.vim'

" undo tree
" Plug 'sjl/gundo.vim'
Plug 'simnalamburt/vim-mundo'

" registers
Plug 'bfredl/nvim-miniyank'

" close the current buffer
Plug 'moll/vim-bbye'

" systemd syntax and error
Plug 'wgwoods/vim-systemd-syntax'

" emmet for html
Plug 'mattn/emmet-vim'

" fzf - poweful fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" allow multisearch in current directory / multi replace as well
Plug 'wincent/ferret'

" display the hexadecimal colors - useful for css and color config
Plug 'ap/vim-css-color'

" easy way to rezise and exchange windows
Plug 'simeji/winresizer'

" replace f F t T to target easily the motion
Plug 'yangmillstheory/vim-snipe'

" Split arrays in PHP / struct in Go / other things
Plug 'AndrewRadev/splitjoin.vim'

" Open man with vim using vman (need to be configured in zsh boot)
Plug 'jez/vim-superman'

" CSV plugin
Plug 'chrisbra/csv.vim'

" toml syntax highlighting
Plug 'cespare/vim-toml'

" Plug to dim not-focused windows
" Plug 'blueyed/vim-diminactive'

" Write file with sudo
Plug 'lambdalisue/suda.vim'

" Display register values on " and @
Plug 'junegunn/vim-peekaboo'
call plug#end()

" source every plugin configs
for file in split(glob("~/.vim/pluggedconf/*.vimrc"), '\n')
    exe 'source' file
endfor

" Use :help <option> to see the docs
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set incsearch
set ignorecase
set wildignorecase
set smartcase
set mouse=a
set hidden
set wildmode=list:longest
set number
set title
set ruler
set nospell
set noswapfile
set list
set listchars=eol:⏎,tab:>-,trail:␠,nbsp:⎵
" Fix for parcel, see:  https://github.com/parcel-bundler/parcel/issues/221
set backupcopy=yes

" Customize view
sy on
set t_Co=256
colorscheme jellybeans

" Key remaps
" nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
nmap <silent> <F5> :!tmux splitw -v -l 5<CR><CR>
nmap <Space> /
nmap 0 ^

:set dictionary="/usr/dict/words" )

" Use fancy buffer closing that doesn't close the split
:nnoremap <silent> <S-Left> :bprevious<CR>
:nnoremap <silent> <S-Right> :bnext<CR>
:noremap <silent> <C-Left> b
:noremap <silent> <C-Right> w

" Replace strings in local or global scope
" https://stackoverflow.com/a/597932/3540564
:nnoremap gr gd[{V%:s/<C-R>///gc<Left><Left><Left>
:nnoremap gR gD:s/<C-R>///gc<Left><Left><Left>

" :w!! sudo saves the file
cmap w!! w !sudo tee % >/dev/null

" NERDTree options
" let NERDTreeAutoCenter = 1
" let NERDTreeCaseSensitiveSort = 1
" let NERDTreeHighlightCursorline = 1
" let NERDTreeMouseMode = 1
" let NERDTreeIgnore=['.*\.o$']
" let NERDTreeIgnore+=['.*\~$']
" let NERDTreeIgnore+=['.*\.out$']
" let NERDTreeIgnore+=['.*\.so$', '.*\.a$']
" let NERDTreeIgnore+=['.*\.pyc$']
" let NERDTreeIgnore+=['.*\.class$']

" Enter just selects the item in the autocomplete menu
" http://vim.wikia.com/wiki/VimTip1386
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Map Ctrl+Space to autocomplete
" https://coderwall.com/p/cl6cpq/vim-ctrl-space-omni-keyword-completion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

set completeopt=noinsert,menuone,noselect

" Custom file types
au BufRead,BufNewFile *.md set filetype=markdown

" Better help navigation
autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>
autocmd FileType help nnoremap <buffer> o /'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
autocmd FileType help nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>

" Automatic commands
" autocmd VimEnter *.c,*.cpp,*.h,*.java,*.py,*.go NERDTree
autocmd FileType c,cpp,h,java,python,go nested :TagbarOpen

" QuickFix window always at the bottom
autocmd FileType qf wincmd J

" Two space indent in Ruby
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" Style vue files
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" Autoload changes in .vimrc
autocmd BufWritePost .vimrc source $MYVIMRC
" Save on application switch
:au FocusLost * silent! wa
