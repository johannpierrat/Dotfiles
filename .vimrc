""""""""""""""""""""""""""""""""""""""""""""""""""
" Description:
"   This is the .vimrc file
"
" Maintainer:
"   Johann "Pitacalo" Pierrat
"   <johann.pierrat@gmail.com>
"
" Acknowledgements:
"   This vimrc is  base of the one of Kévin "Chewie" Sztern
"   Check out his github at: https://github.com/Chewie/
"   Several elements of this .vimrc come from Pierre Bourdon's config
"   You can find it here: https://bitbucket.org/delroth/configs/
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" General Parameters ---------------------------------------------{{{

" Disable vi compatibility mode
set nocompatible

" Pathogen requires the ftplugins to be disabled
filetype plugin off

" /!\ Comment this line if you only have the .vimrc /!\
" Load all the plugins in .vim/bundle
call pathogen#infect()

" Enable filetype detection for plugins and indentation options
filetype plugin indent on
filetype plugin on

" Reload a file when it is changed from the outside
set autoread

" Write the file when we leave the buffer
set autowrite

" Disable backups, we have source control for that
set nobackup

" Force encoding to utf-8, for systems where this is not the default (windows
" comes to mind)
set encoding=utf-8

" Disable swapfiles too
set noswapfile

" Hide buffers instead of closing them
set hidden

" Set the time (in milliseconds) spent idle until various actions occur
" In this configuration, it is particularly useful for the tagbar plugin
set updatetime=500

" Ignore unwanted files
set wildignore=*.o,*~,*.gch,*.so,*.a

" Change the directory to the current directory of the buffer
set autochdir

" Set undo file directories
set undofile
set undodir=$HOME/.vim/undodir

" }}}
" User inteface --------------------------------------------------{{{


" Make backspace behave as expected
set backspace=eol,indent,start

" Set the minimal amount of lignes under and above the cursor
" Useful for keeping context when moving with j/k
set scrolloff=5

" Show current mode
set showmode

" Show command being executed
set showcmd

" Show line number
set number

" Set relative number (easier to jump around)
set relativenumber

" Format the status line ---------------------------------------{{{
" Always show status line
set laststatus=2
" This status line comes from Pierre Bourdon's vimrc
set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)
" Enhance command line completion
set wildmenu
" Set completion behavior, see :help wildmode for details
set wildmode=list:longest:full
" Disable preview window on completion
set completeopt=menu,longest
" Set omnifunc complete
set omnifunc=syntaxcomplete#Complete

" }}}

" Disable bell completely
set visualbell
set t_vb=

" Color the column after textwidth, usually the 80th
if version >= 703
  set colorcolumn=+1
endif

" Display whitespace characters
set list
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤

set fillchars=vert:│

" Enables syntax highlighting
syntax on

" Colorscheme option ------------------------------------------{{{
" Enable Doxygen highlighting
let g:load_doxygen_syntax=1

" Use a slightly darker background color to differentiate with the status line
let g:jellybeans_background_color_256='232'

" Feel free to switch to another colorscheme
colorscheme molokai

" change the color of the column 80 to something correct
hi ColorColumn ctermbg=234

" }}}

" Allow mouse use in vim for visual only
set mouse=v

" Briefly show matching braces, parens, etc
set showmatch

"   Line wrap ---------------------------------------------------{{{
" Enable line wrapping
set wrap

" Wrap on column 80
set textwidth=79
" }}}


" Highlight current line
set cursorline


"   Code Folding --------------------------------------------------{{{
set foldlevelstart=0
set foldmethod=marker
set foldnestmax=10
set foldenable
" }}}

" }}}
" Search options -------------------------------------------------{{{

" Ignore case on search
set ignorecase

" Ignore case unless there is an uppercase letter in the pattern
set smartcase

" Move cursor to the matched string
set incsearch

" Don't highlight matched strings
set nohlsearch

" Toggle g option by default on substition
set gdefault

" }}}
" Indentation options --------------------------------------------{{{

" The length of a tab
" This is for documentation purposes only,
" do not change the default value of 8, ever.
set tabstop=8

" The number of spaces inserted when you press tab
set softtabstop=4

" The number of spaces inserted/removed when using < or >
set shiftwidth=4

" Insert spaces instead of tabs
set expandtab

" When tabbing manually, use shiftwidth instead of tabstop and softtabstop
set smarttab

" Set basic indenting (i.e. copy the indentation of the previous line)
" When filetype detection didn't find a fancy indentation scheme
set autoindent

" This one is complicated. See :help cinoptions-values for details
" This option allow us to correctly indent when a command spread
" multiple lines
set cinoptions=(0,u0,U0,t0,g0,N-s

" }}}
" Mappings -------------------------------------------------------{{{
" Set "," as map leader
let mapleader = ","
" Regex ---------------------------------------------------------{{{
" 'very magic' regexp searches
nnoremap / /\v
nnoremap ? ?\v

" 'very magic' regexp substitutions
cnoremap %s %s/\v
" }}}

" Toggle paste mode
noremap <leader>pp :setlocal paste!<cr>

" Move between rows in wrapped lines
nnoremap j gj
nnoremap k gk

" Yank from cursor to end of line, to be consistent with C and D
nnoremap Y y$

" Write as root, when you forgot to sudoedit
cnoreabbrev w!! w !sudo tee % >/dev/null

" map ; to :
noremap ; :
" Error display -------------------------------------------------{{{
"
" Open the quickfix window if there are errors, or close it if there are no
" errors left
noremap <leader>cw :botright :cw<cr>

" The ultimate mapping for edit/compile/edit workflow
" This mapping runs :make silently, then opens the quickfix window
" if there are errors, or close it if it was already opened and there are
" no more errors
noremap <leader>m :silent! :make \| :redraw! \| :botright :cw<cr>

"}}}
"   Faster windows movement ---------------------------------------{{{
"
noremap <C-h> <C-w><C-h>
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-l> <C-w><C-l>

" }}}

" }}}
" Persistence options --------------------------------------------{{{

" Set location of the viminfo file
set viminfo='20,\"50,<100,n~/.vimtmp/viminfo

" From the Vim wiki
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Persistent undo
if version >= 703
    set undofile
    set undodir=~/.vimtmp/undo
    silent !mkdir -p ~/.vimtmp/undo
endif

" }}}
" Plugin options -------------------------------------------------{{{
"   Rainbow parentheses -------------------------------------------{{{
" Toggle Rainbow Parentheses
au VimEnter * RainbowParenthesesToggleAll

" }}}
" Tagbar --------------------------------------------------------{{{
" Toggle Tagbar
noremap <leader>tt :TagbarToggle<cr>

" }}}
" NERDTree ------------------------------------------------------{{{
" Toggle NERDTree
noremap <leader>nt :NERDTreeToggle<cr>

" }}}
" Tabular--------------------------------------------------------{{{
" Align all variable names with tabular
noremap <leader>ta :Tab / [^ ]*;<cr>

" }}}
" Fugitive ------------------------------------------------------{{{
" Launch fugitive's gstatus
noremap <leader>gs :Gstatus<cr>

" }}}
" Gundo ---------------------------------------------------------{{{
" Shortcut GundoToggle
noremap <leader>@ :GundoToggle<cr>

" }}}
" Powerline -----------------------------------------------------{{{
" Use the patched font for the fancy status line
let g:Powerline_symbols='fancy'

" }}}
"   Syntastic -----------------------------------------------------{{{

" Open the syntax errors location window
noremap <leader>se :Errors<cr>

" Set the C and C++ compilers used for syntax checking with syntastic
let g:syntastic_cpp_compiler='g++'
" Compile flag for C++11 also add additionnal warning
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall -Werror'

let g:syntastic_c_compiler='clang'
let g:syntastic_c_compiler_options = ' -std=c99 -Wall -Wextra -pedantic `sdl-config --cflags`'

" Check headers too, because why wouldn't we?
let g:syntastic_c_check_header=1
let g:syntastic_cpp_check_header=1

" Haskell option
let g:syntastic_haskell_compiler = 'ghc'

" }}}
"   Clang_complete options ----------------------------------------{{{

" Don't complete unless asked to
let g:clang_complete_auto=0

" Use libclang.so instead of the clang executable for clang_complete
let g:clang_use_library=1

" Use snippets to complete
let g:clang_snippets=1
let g:clang_snippets_engine="ultisnips"

" }}}

" }}}
