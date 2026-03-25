set mouse=a
let g:gruvbox_termcolors = 256
set t_Co=256
" " Set leader key
let mapleader = " "

" Force Black color to any theme on vim
"autocmd VimEnter * highlight Normal guibg=#000000 ctermbg=0

" enable syntax "
syntax on
filetype plugin indent on
filetype plugin on

set relativenumber

set laststatus=2
set statusline=%f
set cmdheight=1
set shortmess+=c
" enable line numbers "
set number

set ruler
set noruler
set showcmd


set cursorline
set cursorlineopt=number
" Customize the highlight color
highlight CursorLineNr cterm=bold ctermfg=white ctermbg=darkgrey

highlight Comment cterm=italic gui=italic
highlight htmlArg cterm=italic gui=italic

" enable highlight search pattern "
set incsearch

" enable smartcase search sensitivity "
set ignorecase
set smartcase

" Indentation using spaces "
" tabstop:	width of tab character
" softtabstop:	fine tunes the amount of whitespace to be added
" shiftwidth:	determines the amount of whitespace to add in normal mode
" expandtab:	when on use space instead of tab
" textwidth:	text wrap width
" autoindent:	autoindent in new line
set tabstop	=4
set softtabstop	=4
set shiftwidth	=4
set textwidth	=79
set expandtab
set autoindent

" show the matching part of pairs [] {} and () "
set showmatch

" remove trailing whitespace from Python and Fortran files "
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.f90 :%s/\s\+$//e
autocmd BufWritePre *.f95 :%s/\s\+$//e
autocmd BufWritePre *.for :%s/\s\+$//e

" enable color themes "
"if !has('gui_running')
"	set t_Co=256
"endif
" enable true colors support "
set termguicolors

" enable italics (use \x1b or \e escape)
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"


"-------------------------------------------------------------"
"Bonus. " Find & Replace (if you use the ignorecase, smartcase these are mandatory) "
"            :%s/<find>/<replace>/g   "replace global (e.g. :%s/mass/grass/g)"
"            :%s/<find>/<replace>/gc  "replace global with confirmation"
"            :%s/<find>/<replace>/gi  "replace global case insensitive"
"            :%s/<find>/<replace>/gI  "replace global case sensitive"
"            :%s/<find>/<replace>/gIc "replace global case sensitive with confirmation"

"        " Vim (book)marks "
"            mn     "replace n with a word A-Z or number 0-9"
"            :'n     "go to mark n"
"            :`.     "go to the last change"
"            :marks  "show all declared marks"
"            :delm n "delete mark n"

"        " Delete range selection "
"            :<line_number>,<line_number>d "(e.g. :2,10d deletes lines 2-10)"

"        " LaTeX shortcuts "
"            nnoremap <F1> :! pdflatex %<CR><CR>
"            nnoremap <F2> :! bibtex $(echo % \| sed 's/.tex$//') & disown<CR><CR>
"            nnoremap <F3> :! evince $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
"            nnoremap <F4> :! rm *.log *.aux *.out *.blg & disown<CR><CR>
"

let g:vim_markdown_emphasis_multiline = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_no_extensions_in_markdown = 1

" Enable auto-pairing of quotes
inoremap " ""<Left>
inoremap ' ''<Left>

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
Plug 'ayu-theme/ayu-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'sainnhe/gruvbox-material'
Plug 'arcticicestudio/nord-vim'
Plug 'mbbill/undotree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lifepillar/vim-gruvbox8'
Plug 'cdelledonne/vim-cmake'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-jp/vim-cpp'
Plug 'junegunn/fzf.vim'
Plug 'rose-pine/vim'
Plug 'sainnhe/everforest'
Plug 'ryanoasis/vim-webdevicons'
Plug 'tpope/vim-speeddating'   " optional, for date handling
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'lilydjwg/colorizer'
Plug 'junegunn/goyo.vim'
Plug 'vim-autoformat/vim-autoformat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/vim-markdown'
Plug 'hughbien/md-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'app and yarn install' }
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ryanoasis/vim-devicons'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'

call plug#end()

"Let g:everforest_background = 'hard'
"let g:everforest_transparent_background = 1
"let g:onedark_terminal_italics = 1
"let g:nord_transparent_background = 1
"let g:catppuccin_mocha_background = 'hard'
"let g:catppuccin_mocha_transparent_background = 1
set t_Co=256
set termguicolors
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi NonText guibg=NONE ctermbg=NONE
autocmd vimenter * hi LineNr guibg=NONE ctermbg=NONE
autocmd vimenter * hi Folded guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

" Optional: Make floating windows transparent too
autocmd vimenter * hi NormalFloat guibg=NONE
autocmd vimenter * hi FloatBorder guibg=NONE
colorscheme oled
"=========AIRLINE CONFIG================
let g:airline_powerline_fonts = 1
let g:airline_theme = 'nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = ''
let g:airline_section_c = '%f'
let g:airline_section_x = '%y'
let g:airline_section_y = ''


"===============KEYMAPPING==============="
" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb_d

" Select all
nnoremap <C-a> gg<V-CR>G

" Jumplist
nnoremap <C-m> <C-i>

" New tab
nnoremap te :tabedit<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <s-tab> :tabprev<CR>

" Split window
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>

" Move window
nnoremap sh <C-w>h
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sl <C-w>l

" Resize window
nnoremap <C-w><left> <C-w><
nnoremap <C-w><right> <C-w>>
nnoremap <C-w><up> <C-w>+
nnoremap <C-w><down> <C-w>-

" Diagnostics
nnoremap <C-j> :lua vim.diagnostic.goto_next()<CR>

" FZF keybinding
nnoremap <silent> <Space><Space> :FZF<CR>

" NerdTree Toggle keymapping
nnoremap <leader>n :NERDTreeToggle<CR>

"Add keybind for popup command panel
nnoremap <silent> <Leader>p :Commands<CR>

" Build LaTeX files with this command
nnoremap <leader>bd :w<CR>:!pdflatex %<CR>:!zathura %:r.pdf &<CR><CR>

" KeyMappings for COC.nvim 
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"========================================"

"Pop-up command input
function! CommandPopup()
    let command = input('Command: ')
    execute 'normal! :'.command
endfunction

let g:vimtex_complete_enabled = 1  " Enable vimtex completion
let g:vimtex_complete_close_braces = 1  " Auto-complete closing braces

" Automatically set filetype for .md
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Markdown preview settings
let g:mkdp_auto_start = 0
let g:mkdp_command_for_global = 1
let g:mkdp_browser = 'librewolf' " or chromium, brave, etc.

" plasticboy/vim-markdown

autocmd FileType markdown let b:sleuth_automatic=0
autocmd FileType markdown set conceallevel=0
autocmd FileType markdown normal zR

let g:vim_markdown_frontmatter=1
let g:mkdp_markdown_css='/home/b/.vim/plugged/markdown-preview.nvim/app/night-owl.css'

" Webdevicons configuration
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" setup the md-vim plugin
au bufnewfile,bufread *.md set ft=md

"===============COC SETUP================"
" Always show sign column
set signcolumn=yes

" Coc extensions
" Essential language support extensions
let g:coc_global_extensions = [
  \ 'coc-tsserver',       
  \ 'coc-json',           
  \ 'coc-git',            
  \ 'coc-pyright',        
  \ 'coc-marketplace',        
  \ 'coc-rust-analyzer',        
  \ 'coc-clangd',         
  \ 'coc-cmake',         
  \ 'coc-html',           
  \ 'coc-css',            
  \ 'coc-yaml',           
  \ 'coc-markdownlint',   
  \ 'coc-snippets',       
  \ 'coc-pairs',          
  \ 'coc-prettier',
  \ 'coc-sh',
  \ 'coc-lua',
  \ 'coc-vimlsp',
  \ 'coc-texlab',
  \ 'coc-go',
  \ 'coc-markdown-preview-enhanced',
  \ ]

"Optional additions if you need them:
"\ 'coc-go',             # Go
"\ 'coc-java',           # Java
"\ 'coc-docker',         # Dockerfiles
" Use `:CocInstall coc-git` if not in list

" Key mappings
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"=========================================="

" ========== UNDO TREE CONFIGURATON ==========
" Toggle undotree with F5
nnoremap <F5> :UndotreeToggle<CR>
" If undotree is opened, it will regain focus after undo/redo
let g:undotree_SetFocusWhenToggle = 1
" Auto open diff window
let g:undotree_DiffAutoOpen = 1
" Diff window height
let g:undotree_DiffpanelHeight = 10
" Window layout
let g:undotree_WindowLayout = 2  " 1: left, 2: bottom, 3: right
" Show relative timestamp
let g:undotree_RelativeTimestamp = 1
" Highlight changed text
let g:undotree_HighlightChangedText = 1
" Show help line
let g:undotree_HelpLine = 1
"=============================================

" ======C/C++ specific config======
" Advanced settings
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set list
set listchars=tab:▸\ ,trail:·,nbsp:␣
set undofile
set undodir=~/.vim/undodir
set undolevels=1000
set undoreload=10000

" Project-specific .vimrc
set exrc
set secure

" Terminal in Vim
if has('terminal')
  nnoremap <leader>t :terminal<CR>
endif

" Quickfix navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>

" LSP diagnostics
nnoremap <leader>do :call CocActionAsync('diagnosticInfo')<CR>
nnoremap <leader>df :call CocActionAsync('diagnosticNext')<CR>
nnoremap <leader>dp :call CocActionAsync('diagnosticPrevious')<CR>
"==================================
"
"
