syntax on

"Settings 
set encoding=UTF-8
set nowrap
set number
set shiftwidth=4
set tabstop=4
set relativenumber
set termguicolors
set mouse=a
set cursorline
set smarttab

" map CTRL-l to escape insert mode
imap <C-l> <esc>

"Key remapping
nnoremap <C-n> :NERDTree<CR>
nnoremap <Tab> gt 
nnoremap <S-Tab> gT

" Remaping for CAPS key in vim
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" Remapping so that when hitting enter between parantheses will add an extra lines
inoremap {<cr> {<cr>}<c-o>O<tab>
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap (<cr> (<cr>)<c-o>O<tab>

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-H> <C-W>

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Section for vim plugins
call plug#begin('~/.vim/plugged')

Plug 'svermeulen/vim-cutlass' "Plugin to make it so that the delete functions do not replace the copied/cut segments
Plug 'uiiaoo/java-syntax.vim'
Plug 'scrooloose/nerdtree'
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

"Syntax Highlighters
Plug 'uiiaoo/java-syntax.vim'
Plug 'vim-python/python-syntax'
Plug 'octol/vim-cpp-enhanced-highlight'

"Colorscheme Plugins
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'

call plug#end()

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
let g:multi_cursor_select_all_word_key = '<C-S-l>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<C-S-l>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"=========================== Coc Config ===========================
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-json', 
  \	'coc-kite',
  \	'coc-java',
  \	'coc-python',
  \ 'coc-phpls',
  \ 'coc-html',
  \ ]

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
"let g:tagbar_ctags_bin

" Remap tagbar toggle
" nmap <C-S-j> :TagbarToggle<CR>


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
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.php'

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
colorscheme tender
let g:airline_theme='tender'
