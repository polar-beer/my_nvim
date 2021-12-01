" ----------------
"  Setting
" ----------------
set shell=/bin/zsh " デフォで「Zsh」指定
set shiftwidth=4   " shiftの移動幅
set tabstop=4      " tabの認識幅
set expandtab      " tabを全てspaceに置き換え（コード共有時の作法）
set textwidth=0    " 1行あたりの最大文字数指定（0=未指定）
set autoindent     " コピペする場合は、ペーストモード「:set paste」で補完を解除してから用いる
set hlsearch       " 検索時にハイライト指定 
set clipboard=unnamed " Vimでコピーした文字列を流用できる
syntax on          " コードのシンタックス指定 


" ----------------
"  Plugin Manager 
"  vim-plug https://github.com/junegunn/vim-plug
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

call plug#end()


" ■ vim-horizon
" if you don't set this option, this color might not correct.
"set termguicolors
"
"colorscheme horizon
"
" lightline.
"let g:lightline = {}
"let g:lightline.colorscheme = 'horizon'

" ■ nerdtree : DOMツリーをサイドバーとして表示。
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

