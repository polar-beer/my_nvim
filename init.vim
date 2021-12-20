" ----------------------------------------------------------
"  Setting
" ----------------------------------------------------------

set fenc=utf-8              " 文字コード設定
set showcmd                 " 入力中のコマンドをステータスに表示
set number                  " 行番号表示
set cursorline              " 現在行強調表示
"set cursorcolumn           " 現在列強調表示
set virtualedit=onemore     " 行末一文字先までカーソル移動可能
set showmatch               " ピープ音可視化
set listchars=tab:\▸\-      " 不可視文字可視化(タブが「▸-」と表示)
set listchars=space:•       " 不可視文字可視化(スペースが「•」と表示)
set ignorecase              " 検索文字列が小文字の場合は大文字小文字を区別なく検索
set smartcase               " 検索文字列に大文字が含まれている場合は区別して検索
set incsearch               " 検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan                " 検索時に最後まで行ったら最初に戻る
set hlsearch                " 検索語をハイライト表示
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" cursor
let &t_SI .= "\e[5 q"
let &t_EI .= "\e[1 q"

set shell=/bin/zsh          " デフォで「Zsh」指定
set shiftwidth=4            " 行頭でのTab文字の表示幅
set tabstop=4               " 行頭以外のTab文字の表示幅（スペースいくつ分）
set expandtab               " tabを全てspaceに置き換え（コード共有時の作法）
set textwidth=0             " 1行あたりの最大文字数指定（0=未指定）
set autoindent              " コピペする場合は、ペーストモード「:set paste」で補完を解除してから用いる
set hlsearch                " 検索時にハイライト指定 
set clipboard=unnamed       " Vimでコピーした文字列を流用できる
syntax on                   " コードのシンタックス指定 


" -----------------------------------------------------------
"  Plugin Manager 
"  vim-plug Cf. https://github.com/junegunn/vim-plug
" -----------------------------------------------------------
call plug#begin()
    "'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    "「:PlugInstall」で読み込み。                                    '
    "「:PlugStatus」でステータス確認。                               '
    "「:PlugClean」対象プラグインをコメントアウトしてアンインストール'
    "'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Plug 'preservim/nerdtree'  " ■ nerdtree : DOMツリーをサイドバーとして表示。「ctrl+w+w」Cf. https://github.com/preservim/nerdtree
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " ■ fzf：高速でファイル検索ができる。「:FZF」Cf.https://github.com/junegunn/fzf 
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " ■ coc.nvim：補完機能。 Cf. https://github.com/neoclide/coc.nvim
    " Plug 'sheerun/vim-polyglot' " ■ vim-polyglot：シンタックス等変更(i.g. .csv)。 Cf. https://github.com/sheerun/vim-polyglot

    Plug 'ps173/dadara'
    Plug 'gruvbox-community/gruvbox'
    Plug 'liuchengxu/space-vim-dark'
    Plug 'dracula/vim', {'as': 'dracula'}
  
    " CSS properties and color selector
    Plug 'KabbAmine/vCoolor.vim'
    Plug 'lilydjwg/colorizer'
    " Plug 'ntk148v/vim-horizon' " ■ vim-horizon : Vs-Codeっぽい配色にしてくれる。Cf. https://github.com/ntk148v/vim-horizon

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
    
    " Markdown
    " [:MarkdownPreview] https://github.com/iamcco/markdown-preview.nvim
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

" [vim-plug]以外のプラグイン。
" ■ vim-fugitive ：Vim内でgitコマンドを使用できる(i.g.「:Git blame」)。Cf. https://github.com/tpope/vim-fugitive
" ■ vim-gitgutter：自身の編集箇所を明示的にクイック確認可能。 Cf. https://github.com/airblade/vim-gitgutter
" ■ vim-commnetary：「v -visual mode」で選択して、「gc」を末尾につけるだけ。Cf. https://github.com/tpope/vim-commentary
" ■ coc.nvim：補完機能。 Cf. https://github.com/neoclide/coc.nvim


" ■ vim-horizonaa / space-vim-dark
" if you don't set this option, this color might not correct.
"set termguicolors
"colorscheme horizon
colorscheme space-vim-dark

" lightline.
"let g:lightline = {}
"let g:lightline.colorscheme = 'horizon'


" ■ vim-gitgutter
"let g:gitgutter_highlight_lines = 1 " 変更箇所をハイライト


" ■ [:NERDTree] nerdtree : DOMツリーをサイドバーとして表示。
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" NERD TREE AND ICONS
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeIgnore = ['node_modules']
let NERDTreeStatusline='NERDTree'
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" File explorer plugin
map <C-/> :NERDTreeToggle<CR>
" nerd commenter
noremap <leader>c :NERDCommenterComment<CR>
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" mapping escape to ctrl c
map <Esc><C-c> <CR>
inoremap jk <Esc>
inoremap kj <Esc>
" alternater way to save
nnoremap <silent> <C-s> :w<CR>
nnoremap <silent> <C-Down>    :resize -2<CR>
nnoremap <silent> <C-Up>  :resize +2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>



