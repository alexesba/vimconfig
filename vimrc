set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()
"vim extend functionality
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/xml.vim'
" Autoheader
"  Plugin 'shanzi/autoHEADER'
"Rails Plugins
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-haml'
Plugin 'kchmck/vim-coffee-script'
Plugin 'avakhov/vim-yaml'
"search plugins
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
"   "PHP laravel
Plugin 'xsbeats/vim-blade'
Plugin 'spf13/PIV'
"Plugin 'mjoey/vim-magento'

Plugin 'vim-scripts/matchit.zip'
Plugin 'tpope/vim-surround'

"Git support
Plugin 'tpope/vim-fugitive'

"Suport JS ant js templates
"Plugin 'jeyb/vim-jst'
"Plugin 'AndrewRadev/vim-eco'
"Plugin  'nono/vim-handlebars'

"Adding custom status bar
"Plugin 'maciakl/vim-neatstatus'
"Plugin 'Lokaltog/vim-powerline'

"Rabl syntax
"Plugin 'yaymukund/vim-rabl'
"multiedit cursor plugin
Plugin 'terryma/vim-multiple-cursors'

"delete files usingh comands
Plugin 'tpope/vim-eunuch'

" Go language
Plugin 'jnwhiteh/vim-golang'
Plugin 'Blackrush/vim-gocode'
call vundle#end()
syntax on
filetype plugin indent on
set tabstop=2
set smarttab
set nowrap
set shiftwidth=2
set backspace=2
set backspace=indent,eol,start
set autoindent
set smarttab
set expandtab
set ignorecase
set hlsearch
set incsearch
set number
"Clear last search highlighting
map <Space> :noh<cr>
set ar " autoload edited file
" set textwidth=80

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.+', -1)
endif


set guioptions-=l
set guioptions-=r
set guioptions-=b
set guioptions+=e
set hidden
set laststatus=2
" set cursorline

"custom maps
set backupskip=/tmp/*,/private/tmp/*
set directory=$HOME/.vim/tmp/swap
set undodir=$HOME/.vim/tmp/undo
set undofile
set nobackup
set noswapfile
let mapleader=","
map <leader>n :NERDTreeToggle <cr>
"Typos
command! -bang E e <bang>
command! -bang Q q <bang>
command! -bang W w <bang>
command! -bang QA qa <bang>
command! -bang QA qa <bang>
command! -bang WA wa <bang>
command! -bang WQ wq <bang>
command! -bang Qa qa <bang>
command! -bang Wa wa <bang>
command! -bang Wq wq <bang>
" Use numbers to pick the tab you want (like iTerm)
map <silent> <D-0> :tabn 0<cr>
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>
" color scheme console
"Power Line config
if has("gui_running")
  colorscheme candystripe
  " set background=light
  set guifont=Monaco:h12
  set go=
  set go+=e
else
  colorscheme vividchalk
  " hi Normal ctermfg=252 ctermbg=none
  " hi NonText ctermfg=none ctermbg=none
endif
"
"   "Config for js indentation files
"   let g:html_indent_inctags = "html,body,head,tbodyi"
"   let g:html_indent_script1 = "inc"
"   let g:html_indent_style1 = "inc"
"Toogle comments
nnoremap <silent> <Leader>c :TComment<CR>
vnoremap <silent> <Leader>c :TComment<CR>
inoremap <silent> <Leader>c <Esc>:TComment<CR>i

"Ctrlp
" let g:ctrlp_dont_split = "NERD_tree_2"
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_jump_to_buffer = 0
" let g:ctrlp_map = "<leader>f"
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_match_window_reversed = 1
" let g:ctrlp_split_window = 0
" let g:ctrlp_max_height = 20
" let g:ctrlp_max_depth = 40
" let g:ctrlp_extensions = ['tag']
" let g:ctrlp_max_files=0
" let g:cssColorVimDoNotMessMyUpdatetime = 1
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" nnoremap <leader>. :CtrlPTag<cr>

"Start searching with Ack
nnoremap <leader>a :Ag
set nocp
let coffee_compiler='/usr/local/bin/coffee'
"Format json files
"   command! FormatJSON %!python -m json.tool

set noeb vb t_vb=
au GUIEnter * set vb t_vb=
"  set clipboard=unnamedplus

" Status line
" set statusline=%t       "tail of the filename
" set statusline+=%=      "left/right separator
" set statusline+={%{strlen(&fenc)?&fenc:'none'}, "file encoding
" set statusline+=%{&ff}} "file format
" set statusline+=%h      "help file flag
" set statusline+=%m      "modified flag
" set statusline+=%=      "left/right separator
" set statusline+=%r      "read only flag
" set statusline+=%y      "filetype
" set statusline+=%=      "left/right separator
" set statusline+=%=      "left/right separator
" set statusline+=%l/%L   "cursor line/total lines

"Config wrap word|lines into simple or double quotes
nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q' ciw''<Esc>P
nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

set tags=./.git/tags;
"autocmd bufnewfile *.php :r ~/.vim/templates/php_skeleton.txt
"autocmd BufWritePre * :%s/\s\+$//e


"Magento config
"let g:vimMagentoAuthor = "Alejandro Espinoza <alexesba@gmail.com>"
"let g:vimMagentoCopyright = "Copyright 2016 Alejandro Espinoza"
"let g:vimMagentoLicense = "No License"
