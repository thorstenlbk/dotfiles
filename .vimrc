" Automatically install the plugin manager if missing

" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'roxma/nvim-yarp'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-fugitive'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'tpope/vim-sensible'
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'mhinz/vim-signify'
Plug 'sukima/xmledit'
Plug 'vim-airline/vim-airline'
Plug 'evidens/vim-twig'
Plug 'lepture/vim-jinja'
Plug 'vim-vdebug/vdebug'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'phpactor/ncm2-phpactor'
Plug 'neomake/neomake'
" Color schemes
Plug 'dikiaap/minimalist'
Plug 'modess/vim-phpcolors'
Plug 'arcticicestudio/nord-vim'
call plug#end()

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
let mapleader="-"
" Fix for parcel, see:  https://github.com/parcel-bundler/parcel/issues/221
set backupcopy=yes

" Customize view
sy on
set t_Co=256
colorscheme nord

" Key remaps
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
nmap <F4> :BufExplorerHorizontalSplit<CR>
nmap <silent> <F5> :!tmux splitw -v -l 5<CR><CR>
nmap <Space> /
nmap 0 ^

" Autocompletion on Tab
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
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
let NERDTreeAutoCenter = 1
let NERDTreeCaseSensitiveSort = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeMouseMode = 1
let NERDTreeIgnore=['.*\.o$']
let NERDTreeIgnore+=['.*\~$']
let NERDTreeIgnore+=['.*\.out$']
let NERDTreeIgnore+=['.*\.so$', '.*\.a$']
let NERDTreeIgnore+=['.*\.pyc$']
let NERDTreeIgnore+=['.*\.class$']

" Bufexplorer options
let g:bufExplorerSplitBelow=1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '»'
let g:airline_exclude_preview = 1
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '»'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '«'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '␤ '
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'

" Vim-php-cs-fixer
" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
"let g:php_cs_fixer_config_file = '.php_cs' " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "/usr/bin/php"      " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 1                    " Return the output of command if 1, else an inline information.

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

autocmd FileType php setlocal omnifunc=phpactor#Complete
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Tmux integration
if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Close tmux when exiting vim
" autocmd VimLeave * silent !tmux killp -a

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
autocmd VimEnter *.c,*.cpp,*.h,*.java,*.py,*.go NERDTree
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

