
syntax on
set number
set relativenumber
set clipboard=unnamed
set autoindent
set tabstop=4
set title
set shiftwidth=4
set smarttab
set ignorecase
set ai
set si
set softtabstop=4
set mouse=a

:filetype indent on
:filetype plugin on
set ruler
:syntax enable

call plug#begin('C:/Users/ABIPRAVI/AppData/Local/nvim/plugged')
" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.

Plug 'projekt0n/github-nvim-theme'
Plug 'RishabhRD/popfix'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'RishabhRD/nvim-finder'
Plug 'mhartington/oceanic-next'
Plug 'alvan/vim-closetag'
Plug 'terryma/vim-multiple-cursors'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'Chiel92/vim-autoformat'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque'
Plug 'vim-scripts/pylint.vim'
	Plug 'tpope/vim-haml'
	Plug 'mattn/emmet-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'prettier/vim-prettier', {'do': 'yarn install', 'for': ['javascript', 'htm', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown']}
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'github/copilot.vim'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript'
Plug 'sbdchd/neoformat'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-commentary'
Plug 'jparise/vim-graphql'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'arcticicestudio/nord-vim'
Plug 'tribela/vim-transparent'

call plug#end()

let g:airline_theme='cobalt2'

 " Use <C-j> for both expand and jump (make expand higher priority.)
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


noremap <silent> ff <cmd>Telescope find_files<CR>
noremap <silent> ;r <cmd>Telescope live_grep<CR>
noremap <silent> \\ <cmd>Telescope live_buffers<CR>
noremap <silent> ;; <cmd>Telescope help_tags<CR>
"
command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-k> :Prettier<CR>
nnoremap <C-I> :PlugInstall<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-s> :w<CR>

autocmd FileType python nnoremap <buffer> <F5> :w<cr>:exec '!clear'<cr>:exec '!python3' shellescape(expand('%:p'), 1)<cr>

" :colorscheme OceanicNext 
:colorscheme Nord 
