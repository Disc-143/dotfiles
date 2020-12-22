
"Vundle�֘A�̃R�[�h
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"�����������v���O�C���̓���
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim' 

call vundle#end()
filetype plugin indent on

"lightline�v���O�C���֘A�̋L�q
set t_Co=256

"�J���[�X�L�[��
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

"�V���^�b�N�X�n�C���C�g
syntax enable

"�Ȃɂ���
set ruler

"�s�ԍ��̐F�ݒ�
"�J�[�\�����C���̐F�ݒ�
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=darkmagenta
highlight CursorLineNr term=bold cterm=None ctermfg=Red ctermbg=NONE
highlight LineNr term=bold cterm=None ctermfg=Green ctermbg=NONE
set cursorline
set number

"�C���f���g�ݒ�
set tabstop=2
set shiftwidth=2

"�X���b�v�t�@�C���E�o�b�N�A�b�v�����ݒ�
set nobackup
set noswapfile

"�t�@�C�������֘A
set autoread
set hidden

"���͒��R�}���h�̕\��
set showcmd

"�o�b�N�X�y�[�X�̗L����
set backspace=indent,eol,start

"�s���I��͈͒ǉ�
set virtualedit=onemore

"���ʑΉ��n�C���C�g
set showmatch
set matchtime=1

"�R�}���h�����F[q:] [q/] [q?] �ŌĂяo���\
set history=1000

"�t�@�C�����⊮
set wildmenu
set wildmode=list:longest,full

"�X�}�[�g�C���f���g
set smartindent

"�t�@�C���p�X�̃X���b�V�������ݒ�
set shellslash

"�s�������̕\��
"set list

"�L�[�}�b�s���O�̍Ĕz�u
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

"�t�@�C���G���R�[�f�B���O utf-8���������S
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac

"�X�e�[�^�X���C���ݒ�
set laststatus=2

"�v���O�C���ݒ蒆�ɂ��ꎞ�R�����g�A�E�g
"set statusline=%F

"set statusline+=%m
"set statusline+=%r
"set statusline+=%h
"set statusline+=%w
"set statusline+=%=
"��������E��
"set statusline+=%k
"set statusline+=[ENC=%{&fileencoding}]
"set statusline+=[LOW=%l/%L]

"�N���b�v�{�[�h�֘A
set clipboard=unnamed

"�r�[�v�ݒ�
set noerrorbells

"�����ݒ�
set hlsearch
set incsearch
"�������̑啶�����������
set ignorecase
"�������̑啶���������������̐ݒ�
set smartcase
"�Ō���̎��̌���
set wrapscan
"�u�����̕�����u��
set gdefault

"���ԕ\���v���O��������\��
"echo strftime("%Y/%m/%d %H:%M:%S")


