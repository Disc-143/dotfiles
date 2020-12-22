
"Vundle関連のコード
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"導入したいプラグインの入力
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim' 

call vundle#end()
filetype plugin indent on

"lightlineプラグイン関連の記述
set t_Co=256

"カラースキーム
colorscheme torte

let g:lightline = {
	\ 'colorscheme' : 'wombat',
	\ 'mode_map' : {'c' : 'NORMAL'},
	\ 'active' : {
	\		'left' : [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
	\ },
	\ 'compact_function' : {
	\ 	'modified' : 'LightlineModified',
	\		'readonly' : 'LightlineReadonly',
	\		'fugitive' : 'LightlineFugitive',
	\		'filename' : 'LightlineFilename',
	\		'fileformat' : 'LightlineFileformat',
	\		'filetype' : 'LightlineFiletype',
	\		'fileencoding' : 'LightlineFileencoding',
	\		'mode' : 'LightlineMode'
	\	}
	\ }

function! LightlineModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
	return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
				\	(&ft == 'vimfiler' ? vimfiler' ? vimfiler#get_status_string() :
				\  &ft == 'unite' ? unite#get_status_string() :
				\  &ft == 'vimshell' ? vimshell#get_status_string() :
				\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
				\ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitice()
	if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
		return fugitive#head()
	else
		return ''
	endif
endfunction

function! LightlineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
	return windwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
	return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
	return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"シンタックスハイライト
syntax enable

"なにこれ
set ruler

"行番号の色設定
"カーソルラインの色設定
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=darkmagenta
highlight CursorLineNr term=bold cterm=None ctermfg=Red ctermbg=NONE
highlight LineNr term=bold cterm=None ctermfg=Green ctermbg=NONE
set cursorline
set number

"インデント設定
set tabstop=2
set shiftwidth=2

"スワップファイル・バックアップ無効設定
set nobackup
set noswapfile

"ファイル処理関連
set autoread
set hidden

"入力中コマンドの表示
set showcmd

"バックスペースの有効化
set backspace=indent,eol,start

"行末選択範囲追加
set virtualedit=onemore

"括弧対応ハイライト
set showmatch
set matchtime=1

"コマンド履歴：[q:] [q/] [q?] で呼び出し可能
set history=1000

"ファイル名補完
set wildmenu
set wildmode=list:longest,full

"スマートインデント
set smartindent

"ファイルパスのスラッシュ文字設定
set shellslash

"不可視文字の表示
"set list

"キーマッピングの再配置
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

"ファイルエンコーディング utf-8が多分安全
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac

"ステータスライン設定
set laststatus=2

"プラグイン設定中につき一時コメントアウト
"set statusline=%F

"set statusline+=%m
"set statusline+=%r
"set statusline+=%h
"set statusline+=%w
"set statusline+=%=
"ここから右寄せ
"set statusline+=%k
"set statusline+=[ENC=%{&fileencoding}]
"set statusline+=[LOW=%l/%L]

"クリップボード関連
set clipboard=unnamed

"ビープ設定
set noerrorbells

"検索設定
set hlsearch
set incsearch
"検索時の大文字小文字区別
set ignorecase
"検索時の大文字小文字混同時の設定
set smartcase
"最後尾の次の検索
set wrapscan
"置換時の複数回置換
set gdefault

"時間表示プログラム制作予定
"echo strftime("%Y/%m/%d %H:%M:%S")


