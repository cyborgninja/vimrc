"----------------------------------------------------
" 基本的な設定
"----------------------------------------------------
" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible
" 改行コードの自動認識
set fileformats=unix,dos,mac
" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップをとらない
set nobackup
" ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup
" バックアップをとる場合
"set backup
" バックアップファイルを作るディレクトリ
"set backupdir=~/backup
" スワップファイルを作るディレクトリ
"set directory=~/swap

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
" 行番号を表示しない
set number
" ルーラーを表示
"set ruler
" タブ文字を CTRL-I で表示し、行末に $ で表示する
"set list
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
" オートインデントを無効にする
"set noautoindent
" タブが対応する空白の数
set tabstop=2
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=2
" インデントの各段階に使われる空白の数
set shiftwidth=2
" タブを挿入するとき、代わりに空白を使わない
set expandtab

" indent-guides を有効にする
autocmd VimEnter * :IndentGuidesEnable
" 1インデント目からガイドする
let g:indent_guides_start_level = 1
" 自動カラーを無効にして手動で設定する
let g:indent_guides_auto_colors = 0
" ガイドの幅
let g:indent_guides_guide_size = 1
" インデントカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey235  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey233  ctermbg=233

"----------------------------------------------------
" 国際化関係
"----------------------------------------------------
" 文字コードの設定
" fileencodingsの設定ではencodingの値を一番最後に記述する
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp

"----------------------------------------------------
" オートコマンド
"----------------------------------------------------
if has("autocmd")
    " ファイルタイプ別インデント、プラグインを有効にする
    filetype plugin indent on
    " カーソル位置を記憶する
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

"----------------------------------------------------
" その他
"----------------------------------------------------
" バッファを切替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I

" ヤンクをクリップボードへ
set clipboard=unnamed
set clipboard=autoselect

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" 末尾の半角スペースを視覚化
highlight WhiteSpaceEOL guibg=#fff
2match WhiteSpaceEOL /\S\@<=\s\+$/

"----------------------------------------------------
" NeoBundle http://vim-users.jp/2011/10/hack238/
"----------------------------------------------------

set nocompatible
filetype off

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Use NeoBundle
let g:neocomplcache_enable_at_startup = 1

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-rsense.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'ruby-matchit'
NeoBundle 'vim-scripts/dbext.vim'

let g:neocomplcache_snippets_dir = '~/.vim/snippets'

" support
NeoBundle 'taichouchou2/vim-rsense'

" comment 
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'taichouchou2/surround.vim'

" rails support
NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'
NeoBundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }

" reference environment
NeoBundle 'thinca/vim-ref'
NeoBundle 'taichouchou2/vim-ref-ri'
NeoBundle 'taq/vim-rspec'

" html coding
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'taichouchou2/surround.vim'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'

" Swift
NeoBundle 'toyamarinyon/vim-swift'

filetype plugin on
filetype indent on
syntax on

"----------------------------------------
" open-browser.vim
"----------------------------------------
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"----------------------------------------
" vim-browsereload-mac
"----------------------------------------
" リロード後に戻ってくるアプリ 変更してください
let g:returnApp = "iTerm"
nmap <Space>bc :ChromeReloadStart<CR>
nmap <Space>bC :ChromeReloadStop<CR>
nmap <Space>bf :FirefoxReloadStart<CR>
nmap <Space>bF :FirefoxReloadStop<CR>
nmap <Space>bs :SafariReloadStart<CR>
nmap <Space>bS :SafariReloadStop<CR>
nmap <Space>ba :AllBrowserReloadStart<CR>
nmap <Space>bA :AllBrowserReloadStop<CR>

"----------------------------------------
" zencoding
"----------------------------------------
" codaのデフォルトと一緒にする
imap <C-E> <C-Y>,
let g:user_zen_leader_key = '<C-Y>'
" 言語別に対応させる
let g:user_zen_settings = {
			\ 'lang' : 'ja',
			\ 'html' : {
			\ 'filters' : 'html',
			\ 'indentation' : ' '
			\ },
			\ 'css' : {
			\ 'filters' : 'fc',
			\ },
			\}

"----------------------------------------
" neocomplcache-snippets-complete
" https://gist.github.com/3695830
"----------------------------------------
" keymap"{{{
" Plugin key-mappings.
imap <C-F> <Plug>(neocomplcache_snippets_expand)
smap <C-F> <Plug>(neocomplcache_snippets_expand)
imap <C-U> <Esc>:Unite snippet<CR>
inoremap <expr><C-g> neocomplcache#undo_completion()
au FileType snippet nmap <buffer><Space>e :e #<CR>
" inoremap <expr><C-L> neocomplcache#complete_common_string()

" imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?
" \"\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" :
" \<TAB>"

" snippetの編集
nmap <Space>e :<C-U>NeoComplCacheEditSnippets<CR>
au BufRead,BufNewFile *.snip set filetype=snippet

let g:neocomplcache_enable_auto_select = 0
inoremap <silent><expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-P>" : "\<S-TAB>"
inoremap <silent><expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y> neocomplcache#close_popup()
" inoremap <expr><C-e> neocomplcache#cancel_popup()
" inoremap <silent><CR> <C-R>=neocomplcache#smart_close_popup()<CR><CR>
inoremap <silent><CR> <CR><C-R>=neocomplcache#smart_close_popup()<CR>
" inoremap <silent><expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
" inoremap <silent><expr><CR> neocomplcache#smart_close_popup()."\<C-h>"

"------------------------------------
"" vim-rsense
"------------------------------------
" Rsense
let g:rsenseUseOmniFunc = 1
let g:rsenseHome = expand('~/.vim/ref/rsense-0.3')

function! SetUpRubySetting()
	setlocal completefunc=RSenseCompleteFunction
	nmap <buffer>tj :RSenseJumpToDefinition<CR>
	nmap <buffer>tk :RSenseWhereIs<CR>
	nmap <buffer>td :RSenseTypeHelp<CR>
endfunction
autocmd FileType ruby,eruby,ruby.rspec call SetUpRubySetting()

"------------------------------------
"" scss.syntax
"------------------------------------
au BufRead,BufNewFile *.scss set filetype=scss
