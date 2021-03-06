set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"sintax checker
Plugin 'msanders/snipmate.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mxw/vim-jsx'
"vim extend functionality
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'godlygeek/tabular'
"Autoclose tags
Plugin 'vim-scripts/xml.vim'
Plugin 'vim-scripts/closetag.vim'
"HTML emmet
Plugin 'mattn/emmet-vim'
Plugin 'digitaltoad/vim-jade'

" Javascript autoindent
Plugin 'pangloss/vim-javascript'

" Autoheader
"  Plugin 'shanzi/autoHEADER'
"Rails Plugins
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'avakhov/vim-yaml'
Plugin 'chase/vim-ansible-yaml'
Plugin 'suan/vim-instant-markdown'

" PHP tags
Plugin 'soramugi/auto-ctags.vim'

"search plugins
" Plugin 'kien/ctrlp.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
"PHP laravel
Plugin 'xsbeats/vim-blade'
Plugin 'spf13/PIV'
"Plugin 'mjoey/vim-magento'

Plugin 'vim-scripts/matchit.zip'
Plugin 'tpope/vim-surround'
"Less
Plugin 'groenewege/vim-less'
"Git support
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'

"Suport JS ant js templates
"Plugin 'jeyb/vim-jst'
Plugin 'briancollins/vim-jst'
"Plugin 'AndrewRadev/vim-eco'
"Plugin  'nono/vim-handlebars'

"Adding custom status bar
" Plugin 'maciakl/vim-neatstatus'
"Plugin 'Lokaltog/vim-powerline'

"Rabl syntax
"Plugin 'yaymukund/vim-rabl'
"multiedit cursor plugin
Plugin 'terryma/vim-multiple-cursors'

"delete files usingh comands
Plugin 'tpope/vim-eunuch'

Plugin 'alexesba/colors'

" Go language
" Plugin 'jnwhiteh/vim-golang'
Plugin 'Blackrush/vim-gocode'
" Plugin 'fatih/vim-go'
"
" Plugin 'ryanoasis/vim-devicons'
call vundle#end()
syntax on
set nowrap
" set backspace=2
" set backspace=indent,eol,start
" set ignorecase
set hlsearch
set incsearch
set number

filetype plugin on
" Alternative: use the following to also enable language-dependent indenting.
filetype plugin indent on

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
colorscheme hemisu
set background=light
"Power Line config
if has("gui_running")
  set encoding=utf8
  " set guifont=Monaco\ for\ Powerline\ Plus\ Nerd\ File\ Types:h12
  " set guifont=Inconsolata\ LGC\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Mono:h12
  set guifont=InconsolataForPowerline\ Nerd\ Font:h14
  set go=
  set go+=e
endif
"
"Config for js indentation files
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
"Toogle comments
nnoremap <silent> <Leader>c :TComment<CR>
vnoremap <silent> <Leader>c :TComment<CR>
inoremap <silent> <Leader>c <Esc>:TComment<CR>i

" Ctrlp
let g:ctrlp_dont_split = "NERD_tree_2"
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_map = "<leader>f"
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_max_depth = 40
let g:ctrlp_extensions = ['tag']
let g:ctrlp_max_files=0
let g:cssColorVimDoNotMessMyUpdatetime = 1

let s:ctrlp_fallback = 'ag %s
      \ --nocolor --nogroup --depth 5
      \ --hidden --follow --smart-case
      \ --ignore .bazaar
      \ --ignore .bzr
      \ --ignore .git
      \ --ignore .hg
      \ --ignore .svn
      \ --ignore .ccache
      \ --ignore .DS_Store
      \ --ignore .opt1
      \ --ignore .pylint.d
      \ --ignore .shell
      \ --ignore .wine
      \ --ignore .wine-pipelight
      \ --ignore "**/*.pyc"
      \ --ignore "**/*.class"
      \ --ignore "**/*.o"
      \ -g ""'

let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files . --cached --others --exclude-standard'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': s:ctrlp_fallback
\ }

nnoremap <leader>. :CtrlPTag<cr>

"Start searching with Ack
nnoremap <leader>a :Ag
set nocp
let coffee_compiler='$(which coffee)'
"Format json files
command! FormatJSON %!python -m json.tool

set noeb vb t_vb=
au GUIEnter * set vb t_vb=
"  set clipboard=unnamedplus


hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%f%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=      "left/right separator
set statusline +=%5*%{&ff}%*            "file format
set statusline+=%1*\ %{strlen(&fenc)?&fenc:'none'}\ %* "file encoding
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
" set statusline +=%2*0x%04B\ %*          "character under cursor


" Status line
" set statusline=
" set statusline=%t       "tail of the filename
" set statusline+=%=      "left/right separator
" set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
" set statusline+=%{&ff}] "file format
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
command! CleanUp %s/\s\+$//e


"Magento config
"let g:vimMagentoAuthor = "Alejandro Espinoza <alexesba@gmail.com>"
"let g:vimMagentoCopyright = "Copyright 2016 Alejandro Espinoza"
"let g:vimMagentoLicense = "No License"

"Go config
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
"Autoclose html tags
let g:closetag_html_style=1

" ctags
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_name = 'tags'
let g:auto_ctags_tags_args = '--tag-relative=yes --recurse=yes --exclude=.modman --exclude=.git'

for fpath in split(globpath('~/.vim/settings', '*.vim'), '\n')
  exe 'source' fpath
endfor

" MOVE CODE UP AND DOWN
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
command CleanRepeated %!sort|uniq -c
command Capitalize %s/\<./\u&/g
command Sort '<,'>sort

" NERDTress File highlighting
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"   exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"   exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
" endfunction
"
" call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
" call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
" call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
" call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
" call NERDTreeHighlightFile('rb', 'Red', 'none', '#ffa500', '#151515')
" call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

" let g:webdevicons_enable_ctrlp = 1
"
" let g:WebDevIconsOS = 'Darwin'
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:DevIconsEnableFoldersOpenClose = 1
" set ambiwidth=double
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
