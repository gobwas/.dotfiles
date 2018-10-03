" Configure base view.
" ====================
set tabstop=4     " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4
set noexpandtab
set number
set backspace=indent,eol,start
set viminfo='10,\"100,:20,%,n~/.viminfo
set wildmenu
set hlsearch
set incsearch

set exrc
set secure

syntax on
filetype plugin indent on



" Directories configuration for swap, backup and undo.
" ====================================================

" swap files (.swp) in a common location
" // means use the file's full path
set dir=~/.vim/_swap//

" backup files (~) in a common location if possible
set backup
set backupdir=~/.vim/_backup/,~/tmp,.

" turn on undo files, put them in a common location
set undofile
set undodir=~/.vim/_undo/


" Plugins initialization.
" =======================

" Run pathogen.
execute pathogen#infect()

" Basic display options.
" ======================
set background=light
colorscheme one

" Fuzzy finder integration.
" =========================
set rtp+=~/.fzf
" FZF {{{
" <C-p> to search files
nmap <silent> <C-p> :FZF -m<cr>
nmap <silent> ; :Buffers<cr>
" }}}


" Golang configuration.
" =====================
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_chan_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_operators = 0
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_types = 0
let g:go_highlight_fields = 0
let g:go_highlight_build_constraints = 0
let g:go_highlight_generate_tags = 0
let g:go_highlight_string_spellcheck = 0
let g:go_highlight_format_strings = 0
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0
let g:go_autodetect_gopath = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_options = {
    \ 'gofmt': '-s',
    \ 'goimports': '-local github.my-company-name.ru',
    \ }

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nmap <F8> :TagbarToggle<CR>

" Syntastic configuration.
" ========================

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=3
let g:syntastic_go_checkers = ['gotype', 'golint']
"hi QuickFixLine cterm=None ctermbg=256 guibg=#ffff00


