" ----------------
"  Setting
" ----------------
" ~/.vimrc からの引継
set fenc=utf-8       " 文字コード設定
set showcmd          " 入力中のコマンドをステータスに表示
set number           " 行番号表示
set cursorline       " 現在行強調表示
"set cursorcolumn     " 現在列強調表示
set virtualedit=onemore     " 行末一文字先までカーソル移動可能 
set showmatch               " ピープ音可視化
set list listchars=tab:\▸\- " 不可視文字可視化(タブが「▸-」と表示される)
set ignorecase       " 検索文字列が小文字の場合は大文字小文字を区別なく検索
set smartcase        " 検索文字列に大文字が含まれている場合は区別して検索
set incsearch        " 検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan         " 検索時に最後まで行ったら最初に戻る
set hlsearch         " 検索語をハイライト表示
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


set shell=/bin/zsh " デフォで「Zsh」指定
set shiftwidth=4   " 行頭でのTab文字の表示幅
set tabstop=4      " 行頭以外のTab文字の表示幅（スペースいくつ分）
set expandtab      " tabを全てspaceに置き換え（コード共有時の作法）
set textwidth=0    " 1行あたりの最大文字数指定（0=未指定）
set autoindent     " コピペする場合は、ペーストモード「:set paste」で補完を解除してから用いる
set hlsearch          " 検索時にハイライト指定 
set clipboard=unnamed " Vimでコピーした文字列を流用できる
syntax on             " コードのシンタックス指定 


" ----------------
"  Plugin Manager 
"  [vim-plug] Cf. https://github.com/junegunn/vim-plug
" ----------------
call plug#begin()
  """""""""""""""""""""""""""""""""""
  "「call」の間にプラグインを記述。 "
  "「:PlugInstall」で読み込み。     "
  "「:PlugStatus」でステータス確認。"
  """""""""""""""""""""""""""""""""""
  Plug 'ntk148v/vim-horizon' " ■ vim-horizon : Vs-Codeっぽい配色にしてくれる。Cf. https://github.com/ntk148v/vim-horizon
  Plug 'preservim/nerdtree'  " ■ nerdtree : DOMツリーをサイドバーとして表示。「ctrl+w+w」Cf. https://github.com/preservim/nerdtree
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " ■ fzf：高速でファイル検索ができる。「:FZF」Cf.https://github.com/junegunn/fzf 
  " ■ fugitive ：Vim内でgitコマンドを使用できる。i.g.「:Git blame」Cf. https://github.com/tpope/vim-fugitive
  " ■ vim-gitgutter：自身の編集箇所を明示的にクイック確認可能。 Cf. https://github.com/airblade/vim-gitgutter
  " ■ vim-commnetary： Cf. https://github.com/tpope/vim-commentary
call plug#end()


" ■ vim-horizon
" if you don't set this option, this color might not correct.
set termguicolors
colorscheme horizon
" lightline.
let g:lightline = {}
let g:lightline.colorscheme = 'horizon'

" ■ nerdtree : DOMツリーをサイドバーとして表示。
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" ■ vim-gitgutter
"let g:gitgutter_highlight_lines = 1 " 変更箇所をハイライト


