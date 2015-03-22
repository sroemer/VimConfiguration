" ######################################################################################################################
"   .vimrc - vim configuration file
"
"   author:     Stefan Römer
"               http://www.github.com/sroemer/srVimConfiguration
"
" ######################################################################################################################
set nocompatible            " do not make vim compatible with vi
" use pathogen for installation of plugins and runtime files
execute pathogen#infect()
" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" enable syntax highlighting and filtype plugins / indention
syntax on
filetype plugin on
filetype indent on

set hidden          " handle buffers effecively
set ruler           " show lines and columns in status line
set laststatus=2    " allways show statusline
set showcmd         " show (partial) comman in last line
set history=500     " keep a longer history
set nowrap          " do not wrap lines

set number          " show line numbers
set relativenumber  " show relative line numbers
" disable relative line numbers when vim has no focus
au FocusLost   * :set norelativenumber
au FocusGained * :set relativenumber
" disable relative line numbers in insert mode
au InsertEnter * :set norelativenumber
au InsertLeave * :set relativenumber
set numberwidth=4

" searching
set incsearch       " incremental search (start searching while typing)
set hlsearch        " highlight search results
set ignorecase      " ignore case of letters...
set smartcase       " ...when patter contains lowercase letters (use c\ and \C to override)

" set tab width and use spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,[,]

" no annoying sound on errors
set noerrorbells
set novisualbell

" show location of cursor using a horizontal line
set cursorline

" show matching brackets when text indicator is over them
set showmatch

" turn on the wildmenu
set wildmenu

" file encodings used
set fileencodings=ucs-bom,utf-8,latin1
if has("win32")
    set encoding=latin1
else
    set encoding=utf-8
endif

" auto read when a file was changed from outside of vim
set autoread
set autowrite

" turn backup and swap files on and set directories used
set backup
set writebackup
set backupdir=~/.vim_backups
set swapfile
set directory=~/.vim_backups
" set backup extension (create versioned backups)
au BufWritePre * let &bex = '~' . strftime("%Y%m%d-%H%M%S")

" extended matching on % key (xml, html, ...)
runtime macros/matchit.vim



" ######################################################################################################################
" colorscheme and gui settings
" ######################################################################################################################
" colorscheme molokai if available, otherwise colorscheme desert
try
    colorscheme molokai
catch
    try
        colorscheme desert
    catch
    endtry
endtry

" set lines, columns, guioptions and font
if has("gui_running")
    set columns=160
    set lines=50
    set guioptions-=T     " disable toolbar
    set guioptions-=r     " disable right scrollbar
    set guioptions-=R     " disable right scrollbar (when there is a vertical split window)
    set guioptions-=l     " disable left scrollbar
    set guioptions-=L     " disable left scrollbar (when there is a vertical split window)
    if has("gui_win32")
        set guifont=Consolas:h10
    endif
endif



" ######################################################################################################################
" key mappings
" ######################################################################################################################
" change leader key from '\' to ','
let mapleader = ","

" toggle mini buffer explorer
nmap <silent> <F1> :MBEToggle<CR>
" disable highlighted search results
nmap <silent> <Leader><Leader>/ :nohlsearch<CR>
nmap <silent> <Leader><Leader>? :nohlsearch<CR>
" toggle line wrap
nmap <silent> <Leader><Leader>w :setlocal wrap!<CR>
" toggle line numbering
nmap <silent> <Leader><Leader>n :setlocal relativenumber!<CR>
" reindent whole file
nmap <silent> <Leader><Leader><TAB>   :call MyPreserveState("normal gg=G")<CR>
" remove trailing whitespaces
nmap <silent> <Leader><Leader><SPACE> :call MyPreserveState("%s/\\s\\+$//ge")<CR>

" fast switching between buffers
nmap <silent> <C-TAB>   :bNext<CR>
nmap <silent> <C-S-TAB> :bprevious<CR>
" make Y consistent with C and D
nmap <silent> Y y$
" moving lines up/down
nmap <silent> <C-UP>   :m-2<CR>
nmap <silent> <C-DOWN> :m+1<CR>
" make backspace delete selection in visual mode
vmap <silent> <BS> d



" ######################################################################################################################
" highlighting
" ######################################################################################################################
" highlight trailing whitespaces
hi Trailingwhitespaces guibg=red
match TrailingWhitespaces '\s\+$'



" ######################################################################################################################
" helper functions
" ######################################################################################################################
function MyPreserveState(command)
    " Save the last search
    let last_search=@/
    " Save the current cursor position
    let save_cursor = getpos(".")
    " Save the window position
    normal H
    let save_window = getpos(".")
    call setpos('.', save_cursor)

    " Do the business:
    execute a:command

    " Restore the last_search
    let @/=last_search
    " Restore the window position
    call setpos('.', save_window)
    normal zt
    " Restore the cursor position
    call setpos('.', save_cursor)
endfunction



" ######################################################################################################################
" end of vimrc file
" ######################################################################################################################
