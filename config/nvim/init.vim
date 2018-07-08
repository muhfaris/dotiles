call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'raimondi/delimitmate'
Plug 'terryma/vim-multiple-cursors'
Plug 'ekalinin/Dockerfile.vim'
Plug 'conradirwin/vim-bracketed-paste'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'altercation/vim-colors-solarized'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'fatih/molokai'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'airblade/vim-gitgutter'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'myusuf3/numbers.vim'
Plug 'digitaltoad/vim-pug'
Plug '~/.fzf'
Plug 'tpope/vim-sleuth'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plug 'zchee/deoplete-go', { 'do': 'make'}
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
if has('pythonx')
  let s:py = 'pythonx'
  let s:pyeval = function('pyxeval')
elseif has('python3')
  let s:py = 'python3'
  let s:pyeval = function('py3eval')
else
  let s:py = 'python'
  let s:pyeval = function('pyeval')
endif
call plug#end()
"----------- GENERAL SETTING ---------------
"let g:powerline_pycmd ='py3'
let g:powerline_loaded = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1

"gocode
" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1

" line indent
let g:indentLine_char = '┆'

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#package_dot = 1

" Highlight text search result
set hlsearch
" Enable line number
set number
" Enable cursorline
set cursorline
" Set encoding to utf-8
set encoding=utf8
" Set max characters per line
set textwidth=80
" Enable case insensitive case search
set ignorecase
" Become case sensitive if we type uppercase
set smartcase
" Search scan will back to top if reach end of file
set wrapscan
" Set fileformat to unix explicitly
set fileformat=unix
" Show filename in titlebar
set title
" 2 lines above/below cursor when scrolling
set scrolloff=2
" Remember undo after quitting
set hidden
" Keep 50 lines of command history
set history=50
" Search incremently (search while typing)
set incsearch
" Default clipboard using X window clipboard.
" This clipboard settings is cross-platform.
" On Ubuntu, please install vim-gtk
set clipboard^=unnamed,unnamedplus
" Always showing bar at bottom
set laststatus=2
" Hide default mode display
set noshowmode

" Default tabbing
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Enable syntax highlighting
syntax on

" Enable filetype checking
filetype plugin on

" Tab settings per file type.
autocmd Filetype go setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype pug setlocal ts=2 sts=2 sw=2 expandtab
let g:sleuth_automatic = 1

set completeopt=preview
"set omnifunc=syntaxcomplete#Complete
" Configure color scheme
" Support 256 color in terminal
set t_Co=256
"let g:molokai_original = 1
let g:rehash256 = 1
" Set colorscheme to molokai
colorscheme molokai
" Set mapleader to comma
let mapleader = ","

" Use Prettier
nmap <Leader>pr <Plug>(Prettier)
" Use markdown frontmatter
let g:vim_markdown_frontmatter = 1

" Numbers.vim
let g:numbers_exclude = ['tagbar', 'gundo', 'nerdtree']

" Neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3

" Gundo
" Configure Gundo to use python3 instead of python2
let g:gundo_prefer_python3 = 1
let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let g:python3_host_skip_check = 1
" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'RO' : ''
endfunction
function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:p') ? expand('%:p') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction
function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⎇'.' '.branch : ''
  endif
  return ''
endfunction
function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction
function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction
function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" NERDTree
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeUseSimpleIndicator = 1

let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1



" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Vim-go
let g:go_list_type = "quickfix"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_fmt_command = "gofmt"
let g:go_doc_keywordprg_enabled = 1
let g:go_doc_max_height = 20
let g:go_def_reuse_buffer = 1
let g:go_decls_includes = 'func,type'

" Vim JSX
" JSX syntax highlighting support only on .jsx file extension by default. This
" configuration is to enable jsx syntax highlighting on .js files too.
let g:jsx_ext_required = 0

" Syntax highlighting in Markdown
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['bash=sh', 'css', 'django', 'handlebars', 'javascript', 'js=javascript', 'json=javascript', 'perl', 'php', 'python', 'ruby', 'sass', 'xml', 'html']

" Configure ack vim to use ag if ag available. If not, fallback to ack
if executable('ag')
 let g:ackprg = 'ag --vimgrep'
endif

"Copy / Paste
vmap <c-c> y:call system("xclip -i -selection clipboard", getreg("\""))<cr>:call system("xclip -i", getreg("\""))<cr>
nmap <c-v> :call setreg("\"", system("xclip -o -selection clipboard"))<cr>p")")")"))

"Undo / Redo
let vimDir = '$HOME/.vim/backup/'

if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')

    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Keyboard shortcuts
" Select all text on buffer
map <C-a> <esc>ggVG<CR>
" Makes Ctrl-W close buffer/quit without save and warning
"map <C-W> :q!<CR>
" Shifting blocks configuration
" This indentation configuration makes
" shifting blocks remain in visual mode
vnoremap > >gv
vnoremap < <gv
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnew<CR>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>
nnoremap H gT
nnoremap L gt
nnoremap <C-p> :FZF<CR>
nnoremap <F2> :NumbersToggle<CR>
" Press F3 to save all
nnoremap <F3> :wa<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <C-m> :NERDTreeToggle<CR>
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <F9> :Ack
nnoremap <silent> <leader>n :nohlsearch<CR>

" jump with other window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" resize windows
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" Resize the current split to at least (90,25) but no more than (140,60)
" or 2/3 of the available space otherwise.

function Splitresize()
    let hmax = max([winwidth(0), float2nr(&columns*0.66), 90])
    let vmax = max([winheight(0), float2nr(&lines*0.66), 25])
    exe "vertical resize" . (min([hmax, 140]))
    exe "resize" . (min([vmax, 60]))
endfunction

" move between splits without the ctrl-w prefix
"nnoremap <silent><C-J> <C-W><C-J>:call Splitresize()<CR>
"nnoremap <silent><C-K> <C-W><C-K>:call Splitresize()<CR>
"nnoremap <silent><C-L> <C-W><C-L>:call Splitresize()<CR>
"nnoremap <silent><C-H> <C-W><C-H>:call Splitresize()<CR>

