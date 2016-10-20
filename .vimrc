if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/cyborgninja/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/cyborgninja/.vim/bundle')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/unite.vim') " ファイル操作とか
call dein#add('Shougo/neocomplete.vim') " 補完
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neocomplcache.vim')
call dein#add('Shougo/neocomplcache-rsense.vim')
call dein#add('itchyny/lightline.vim') " 情報を見やすく
call dein#add('nathanaelkane/vim-indent-guides') " インデントを色分け
call dein#add('tpope/vim-rails')
call dein#add('szw/vim-tags')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })


" neocomplcacheの設定
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1


" Rsense用の設定
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"rsenseのインストールフォルダがデフォルトと異なるので設定
let g:rsenseHome = expand("*Rsenseのインストールパスをここにペースト*")
let g:rsenseUseOmniFunc = 1


" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


"----------------------------------------------------
" 検索関係
"----------------------------------------------------
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" インクリメンタルサーチを使わない
set noincsearch

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
" 背景色
colorscheme darkblue
" タイトルをウインドウ枠に表示する
set title
" 行番号を表示
set number
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2
" シンタックスハイライトを有効にする
syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメント文の色を変更
highlight Comment ctermfg=DarkCyan
" コマンドライン補完を拡張モードにする
set wildmenu

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
" ステータスラインの色
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

"----------------------------------------------------
" インデント
"----------------------------------------------------
" タブが対応する空白の数
set tabstop=2
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=2
" インデントの各段階に使われる空白の数
set shiftwidth=2
" タブを挿入するとき、代わりに空白を使わない
set expandtab

" indent colors
let g:indent_guides_enable_on_vim_startup=1
" 1インデント目からガイドする
let g:indent_guides_start_level = 1
" 自動カラーを無効にして手動で設定する
let g:indent_guides_auto_colors = 0
" ガイドの幅
let g:indent_guides_guide_size = 1
" インデントカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#010101  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#0F0F0F  ctermbg=233

"----------------------------------------------------
" 国際化関係
"----------------------------------------------------
" 文字コードの設定
" fileencodingsの設定ではencodingの値を一番最後に記述する
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp

"----------------------------------------------------
" その他
"----------------------------------------------------
" バッファを切替えてもundoの効力を失わない
set hidden

" ヤンクをクリップボードへ
set clipboard=unnamed

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" 末尾の半角スペースを視覚化
highlight WhiteSpaceEOL guibg=#FFFFFF
2match WhiteSpaceEOL /\S\@<=\s\+$/
