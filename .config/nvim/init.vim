syntax on

"Settings 
set encoding=UTF-8
set nowrap
set number
set shiftwidth=2
set tabstop=2
set noswapfile
set relativenumber
set termguicolors
set mouse=a
set cursorline
set smarttab
set incsearch
set nohlsearch
set scrolloff=5

"set hlsearch on temporarily only
augroup vimrc-incsearch-highlight
	autocmd!
	autocmd CmdlineEnter /,\? :set hlsearch
augroup END
		
" Press Space to turn off highlighting and clear any message already displayed; In case the temporary hlsearch above doesn't go off
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"Set word wrap and line break for txt and md files only
autocmd BufRead,BufNewFile   *.txt setlocal wrap linebreak
autocmd BufRead,BufNewFile   *.md setlocal wrap linebreak

"Search visually selected word
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" map CTRL-l to escape insert mode
imap <C-l> <esc>

"====== Key remapping
nnoremap <C-n> :NERDTree<CR>
nnoremap <Tab> gt 
nnoremap <S-Tab> gT
" Close a tab 
nnoremap <A-q> :tabclose<CR>
" Invoke terminal and split open at the bottom
noremap <F5> :below split \| term<CR>
" Save a file with Ctrl+S 
inoremap <C-s> <esc>:w<CR>
noremap <C-s> :w<CR>
" Toggle between bracket pairs
nnoremap <S-b> %

" Mapping to move lines of texts/codes up or down 
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Moving cursor while in insert mode
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-h> <Left>
inoremap <A-l> <Right>

" Remaping for CAPS key in vim
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" Remapping so that when hitting enter between parantheses will add an extra lines
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-H> <C-W>

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Section for vim plugins
call plug#begin('~/.vim/plugged')

Plug 'svermeulen/vim-cutlass' "Plugin to make it so that the delete functions do not replace the copied/cut segments
Plug 'uiiaoo/java-syntax.vim'
Plug 'jceb/vim-orgmode' " Plugin to add Org Mode to VIM
Plug 'scrooloose/nerdtree' " VIM FileTree explorer sidebar
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'preservim/nerdcommenter' " Toggle commenter
Plug 'tpope/vim-commentary' 
Plug 'airblade/vim-gitgutter' " git diff highlighting
Plug 'preservim/tagbar' "To browse all variables, functions, etc.
Plug 'alvan/vim-closetag' " Auto close html,xml,etc. tags
Plug 'terryma/vim-multiple-cursors'
"CtrlPVim fuzzy fuzzyfinder
Plug 'ctrlpvim/ctrlp.vim'
"Implement vim's fuzzyfinder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'bagrat/vim-buffet'
Plug 'ObserverOfTime/coloresque.vim' "Vim colour preview on hex values, etc.
Plug 'szw/vim-maximizer'
" ======== Airline Git branch indicator =======
Plug 'tpope/vim-fugitive' "Git plugin for vim
"Remapping <leader>G to invoke git
nnoremap <leader>g :G<CR>

" Markdown editing setup
"Plug 'godlygeek/tabular' "Aligning text 
Plug 'plasticboy/vim-markdown'

" Flutter setup
Plug 'dart-lang/dart-vim-plugin' "Dart language syntax highlighting
Plug 'natebosch/vim-lsc' "Dart Language Server Protocol
Plug 'natebosch/vim-lsc-dart' "Calls vim-lsc to register the analysis server as a language server

" Snippets setup
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Snippets keybindings
let g:UltiSnipsJumpForwardTrigger="<c-j>"                                       
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" =========== Syntax Highlighters =============
Plug 'uiiaoo/java-syntax.vim'
Plug 'vim-python/python-syntax'
Plug 'octol/vim-cpp-enhanced-highlight'
" Javascript and JSX
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'

" ======================== Vim Debugger =========================
Plug 'puremourning/vimspector'

"================ Colored Brackets ==============
"Plug 'frazrepo/vim-rainbow' "Old colorbracket pairing plugin
Plug 'luochen1990/rainbow'
" =========== Brackets Config =============
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['#dbf277', '#9fcccd', '#dbaef5', '#4db9f0', '#82e0b3'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'contains_prefix': 'TOP',
\	'parentheses_options': '',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		},
\		'lisp': {
\			'guifgs': ['#8cf1fa', 'DarkOrange3', 'DarkOrchid3', '#bf0a5e','#90d914'],
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\		},
\		'ocaml': {
\			'parentheses': ['start=/(\ze[^*]/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\[|/ end=/|\]/ fold', 'start=/{/ end=/}/ fold'],
\		},
\		'tex': {
\			'parentheses_options': 'containedin=texDocZone',
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody,vimExecute',
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold'],
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow',
\		},
\		'php': {
\			'syn_name_prefix': 'phpBlockRainbow',
\			'contains_prefix': '',
\			'parentheses': ['start=/(/ end=/)/ containedin=@htmlPreproc contains=@phpClTop', 'start=/\[/ end=/\]/ containedin=@htmlPreproc contains=@phpClTop', 'start=/{/ end=/}/ containedin=@htmlPreproc contains=@phpClTop'],
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\		},
\		'css': 0,
\		'sh': 0,
\	}
\}

"Colorscheme Plugins
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/everforest'

call plug#end()

" ======================= Vim-maximizer ==================
nnoremap <silent><leader>z :MaximizerToggle<CR>
vnoremap <silent><leader>z :MaximizerToggle<CR>gv
inoremap <silent><leader>z <C-o>:MaximizerToggle<CR>

" ======================== Vim-Cutlass =====================
"Remapping to complement vim-cutlass
nnoremap x d
xnoremap x d
nnoremap xx dd
nnoremap X D

"Key mapping to allow copying to clipboard
noremap <C-c> "+y

" ======================== Multi Cursor ========================

"Remapping for multicursor
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-m>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"=========================== Coc Config ===========================
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \	'coc-python',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-eslint', 
  \ 'coc-json', 
  \	'coc-java',
  \ 'coc-phpls',
  \ 'coc-html',
  \ 'coc-flutter',
  \ ]

"nmap <Esc> :call coc#float#close_all() <CR>

"----------------------- Coc Key Remapping --------------------------
" Use <c-space> to enter selected.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"Use <C-j> and <C-k> to navigate the completion list:
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"-------------------- coc-pairs setting -----------------------------
autocmd FileType * let b:coc_pairs_disabled = ["<"] 

" Enable the enhanced cpp syntax highlightin settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" Tagbar setting
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" Remap tagbar toggle
nnoremap <silent> <leader>v :TagbarToggle<CR>
" Settings for tags file
set tags=tags;/

"=====================  NerdCommenter settings =============================

" Remap the key bindings for nerdcommenter
map <C-_> <leader>c<space> 
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" ======================== NerdTree Settings ==============================

" Settings for devicons in nerdtree
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
autocmd FileType nerdtree setlocal nolist


" ======================== AutoCloseTag settings ===========================

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.php, *.md'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


" ---------------------- Aesthetic -------------------------------
"set colorscheme
let g:everforest_background = 'soft'
let g:everforest_enable_italic = 1
colorscheme everforest
let g:airline_theme='everforest'
"highlight Normal guibg=none
