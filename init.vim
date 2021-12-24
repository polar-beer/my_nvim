"_______________________________// General //_________________________________
set number                  " 行番号表示
set cursorline              " 現在行強調表示
"set cursorcolumn           " 現在列強調表示
set virtualedit=onemore     " 行末一文字先までカーソル移動可能
" set listchars=tab:\▸\-      " 不可視文字可視化(タブが「▸-」と表示)
set listchars=space:•       " 不可視文字可視化(スペースが「•」と表示)
set ignorecase              " 検索文字列が小文字の場合は大文字小文字を区別なく検索
set smartcase               " 検索文字列に大文字が含まれている場合は区別して検索
set incsearch               " 検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan                " 検索時に最後まで行ったら最初に戻る

" #ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" cursor
" let &t_SI .= "\e[5 q"
" let &t_EI .= "\e[1 q"

set shell=/bin/zsh          " デフォで「Zsh」指定
set shiftwidth=4            " 行頭でのTab文字の表示幅
set tabstop=4               " 行頭以外のTab文字の表示幅（スペースいくつ分）
set expandtab               " tabを全てspaceに置き換え（コード共有時の作法）
set textwidth=0             " 1行あたりの最大文字数指定（0=未指定）
set autoindent              " コピペする場合は、ペーストモード「:set paste」で補完を解除してから用いる
set hlsearch                " 検索時にハイライト指定 
set clipboard=unnamed       " yank(vimでコピー)した文字列をクリップボードにコピー
syntax on                   " コードのシンタックス指定

" #use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" #mapping escape to ctrl c
map <Esc><C-c> <CR>
inoremap jk <Esc>
inoremap kj <Esc>

" #alternater way to save
nnoremap <silent> <C-s> :w<CR>
nnoremap <silent> <C-Down>    :resize -2<CR>
nnoremap <silent> <C-Up>  :resize +2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>


"_______________________________// Plugin_Manager //_________________________________
"  vim-plug Cf. https://github.com/junegunn/vim-plug

call plug#begin()
"----------------------------------------------------------------'
"「:PlugInstall」で読み込み。                                    '
"「:PlugStatus」でステータス確認。                               '
"「:PlugClean」対象プラグインをコメントアウトしてアンインストール'
"----------------------------------------------------------------'
Plug 'preservim/nerdtree'                           " DOMツリーをサイドバーとして表示。「ctrl+w+w」
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " 高速でファイル検索ができる。「:FZF」
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " 補完機能。
" Plug 'sheerun/vim-polyglot'                       " シンタックス等変更(ig. [.csv])。
Plug 'ps173/dadara'
Plug 'gruvbox-community/gruvbox'
Plug 'liuchengxu/space-vim-dark'
Plug 'dracula/vim', {'as': 'dracula'}

" #CSS properties and color selector
Plug 'KabbAmine/vCoolor.vim'
Plug 'lilydjwg/colorizer'
" Plug 'ntk148v/vim-horizon'                        " Vs-Codeっぽい配色にしてくれる。

" File explorer
Plug 'ryanoasis/vim-devicons'

" Intellisense and code completion with syntax highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-json', 'coc-tsserver']
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdcommenter'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" MarkdownPreview
" [:MarkdownPreview] https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()


"_______________________________// Other_Plugin //_________________________________
" vim-fugitive  ：Vim内でgitコマンドを使用できる(ig.「:Git blame」)。
" vim-gitgutter ：自身の編集箇所を明示的にクイック確認可能。
" vim-commnetary：「v -visual mode」で選択して、「gc」を末尾につけるだけ。
" coc.nvim      ：補完機能。


"_______________________________// Plugin_Setting //_________________________________
" #vim-horizonaa / space-vim-dark
"set termguicolors
"colorscheme space-vim-dark

"colorscheme horizon
"let g:lightline = {}
"let g:lightline.colorscheme = 'horizon'


" #vim-gitgutter
"let g:gitgutter_highlight_lines = 1 " 変更箇所をハイライト


" #[:NERDTree] nerdtree : DOMツリーをサイドバーとして表示。
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" #NERD TREE AND ICONS
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeIgnore = ['node_modules']
let NERDTreeStatusline='NERDTree'

" #Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" #File explorer plugin
map <C-/> :NERDTreeToggle<CR>

