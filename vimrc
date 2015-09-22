" Vimrc Config file : AlexQian

" 字体, 这个网址下载Monaco
" https://github.com/cstrap/monaco-font
"


" 开启语法高亮功能
syntax enable
syntax on

" 显示行号
set number

" 自动切换当前目录为当前文件所在的目录
set autochdir

" 下面两行改变备份文件存放路径
set backupdir=~/.vim/backup
set directory=~/.vim/backup

"设置C/C++方式自动对齐
set autoindent
set cindent

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" 设置匹配模式，左括号匹配右括号
set showmatch

" 在编辑过程中，在右下角显示光标位置的状态行
set ruler

" 匹配高亮
"set nohls

" 增量查找
set incsearch

" 设置当文件被改动时自动载入
set autoread

" 编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" 语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" In Visual Block Mode, cursor can be positioned where there is no actual character
set ve=block

" Then, Vundle config

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" Add Herer

" 主题 solarized
Bundle "altercation/vim-colors-solarized"
" 主题 molokai
Bundle "tomasr/molokai"
"目录文件导航
Bundle "scrooloose/nerdtree"
"标签导航，纬度和taglist不同
Bundle "majutsushi/tagbar"
" 美化状态栏
Bundle "Lokaltog/vim-powerline"
" 括号匹配高亮
Bundle "kien/rainbow_parentheses.vim"
" 标志无效空格
Bundle "bronson/vim-trailing-whitespace"
" 快速加减注释
Bundle "scrooloose/nerdcommenter"

" All of your Plugins must be added before the following line

call vundle#end()            " required

filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" 详细设定

" 主题 solarized
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

" 主题 molokai
let g:molokai_original = 1

" 配色方案
set background=dark
set t_Co=256
"colorscheme solarized
colorscheme molokai

"目录文件导航
"nt 打开nerdree窗口，在左侧栏显示
noremap <leader>nt :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ ".pyc$", ".pyo$", ".obj$", ".o$", ".so$", ".egg$", "^.git$", "^.svn$", "^.hg$" ]
"let g:netrw_home="~/.vim/backup"
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

"标签导航，纬度和taglist不同
"nb 打开tagbar窗口
noremap <leader>tb :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" 美化状态栏
"if want to use fancy,need to add font patch -> git clone git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
"let g:Powerline_symbols = "fancy"
let g:Powerline_symbols = "unicode"

" 括号匹配高亮
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3' ],
    \ ['Darkblue',    'SeaGreen3'  ],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3' ],
    \ ['darkcyan',    'RoyalBlue3' ],
    \ ['darkred',     'SeaGreen3'  ],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3' ],
    \ ['gray',        'RoyalBlue3' ],
    \ ['black',       'SeaGreen3'  ],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3' ],
    \ ['darkgreen',   'RoyalBlue3' ],
    \ ['darkcyan',    'SeaGreen3'  ],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3' ],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0

" 标志无效空格
" +space去掉末尾空格
noremap <leader><space> :FixWhitespace<cr>

" 快速加减注释
let NERDSpaceDelims = 1

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set csverb
    set cspc=3
    "add any database in current dir
    if filereadable("cscope.out")
        cs add cscope.out
        "else search cscope.out elsewhere
    else
        let cscope_file=findfile("cscope.out",".;")
        let cscope_pre=matchstr(cscope_file,".*/")
        if empty(cscope_file) && filereadable(cscope_file)
            exe "cs add" cscope_file cscope_pre
        endif
    endif
endif
