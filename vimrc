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

noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
"
"
"
"
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
"
" Find Plugin Name with http://vim-scripts.org/vim/scripts.html

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
Bundle 'altercation/vim-colors-solarized'
" 主题 molokai
Bundle 'tomasr/molokai'
" 补全插件
Bundle 'neocomplcache'
" 补全插件
Bundle 'SuperTab'
" 目录文件导航
Bundle 'scrooloose/nerdtree'
" 路径查找
Bundle 'ctrlp.vim'
" 标签导航
Bundle 'majutsushi/tagbar'
" 标签导航
Bundle 'taglist.vim'
" 美化状态栏
Bundle 'Lokaltog/vim-powerline'
" 括号匹配高亮
Bundle 'kien/rainbow_parentheses.vim'
" 标志无效空格
Bundle 'bronson/vim-trailing-whitespace'
" 快速加减注释
Bundle 'scrooloose/nerdcommenter'


" All of your Plugins must be added before the following line

call vundle#end()            " required

filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" 详细设定
"
"
" 主题 solarized
" Bundle 'altercation/vim-colors-solarized'
"
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

" 主题 molokai
" Bundle 'tomasr/molokai'

"let g:molokai_original = 1

" 配色方案
set background=dark
set t_Co=256
"colorscheme solarized
colorscheme molokai

" 补全插件
" Bundle 'neocomplcache'
" There is a newer plugin : neocomplete.vim
"
let g:neocomplcache_enable_at_startup = 1     "vim 启动时启用插件
" let g:neocomplcache_disable_auto_complete = 1 "不自动弹出补全列表
" 在弹出补全列表后用 <c-p> 或 <c-n> 进行上下选择效果比较好

" 补全插件
" Bundle 'SuperTab'
" SuperTab使Tab快捷键具有更快捷的上下文提示功能

" 目录文件导航
" Bundle 'scrooloose/nerdtree'

" nt 打开nerdree窗口，在左侧栏显示
"noremap <F2> :NERDTreeToggle<CR>
noremap <leader>nt :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ ".pyc$", ".pyo$", ".obj$", ".o$", ".so$", ".egg$", "^.git$", "^.svn$", "^.hg$" ]
"let g:netrw_home="~/.vim/backup"
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

" 路径查找
" Bundle 'ctrlp.vim'

" 一个全路径模糊文件，缓冲区，最近最多使用，... 检索插件；详细帮助见 :h ctrlp
" 常规模式下输入：Ctrl + p 调用插件

let g:ctrlp_map = ',,'
let g:ctrlp_open_multiple_files = 'v'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(log|jpg|png|jpeg)$',
  \ }

" 标签导航
" Bundle 'majutsushi/tagbar'
"
" 相对 TagList 能更好的支持面向对象
" 常规模式下输入 tb 调用插件，如果有打开 TagList 窗口则先将其关闭
"
noremap <leader>tb :TlistClose<CR>:TagbarToggle<CR>
let g:tagbar_autofocus = 1

" 标签导航
" Bundle 'taglist.vim'
"
" 高效地浏览源码, 其功能就像vc中的workpace
" 那里面列出了当前文件中的所有宏,全局变量, 函数名等
" 常规模式下输入 tl 调用插件，如果有打开 Tagbar 窗口则先将其关闭

noremap <leader>tl :TagbarClose<CR>:Tlist<CR>
let Tlist_Show_One_File=1                   "只显示当前文件的tags
" let Tlist_Enable_Fold_Column=0            "使taglist插件不显示左边的折叠行
let Tlist_Exit_OnlyWindow=1                 "如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_File_Fold_Auto_Close=1            "自动折叠
let Tlist_WinWidth=30                       "设置窗口宽度
let Tlist_Use_Right_Window=1                "在右侧窗口中显示

" 美化状态栏
" Bundle 'Lokaltog/vim-powerline'

" 状态栏插件，更好的状态栏效果

"if want to use fancy,need to add font patch -> git clone git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
"let g:Powerline_symbols = "fancy"
let g:Powerline_symbols = "unicode"

" 括号匹配高亮
" Bundle 'kien/rainbow_parentheses.vim'

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
" Bundle 'bronson/vim-trailing-whitespace'

" +space去掉末尾空格

noremap <leader><space> :FixWhitespace<cr>

" 快速加减注释
" Bundle 'scrooloose/nerdcommenter'

" 快速加减注释
" <Leader>ci 以每行一个 /* */ 注释选中行(选中区域所在行)，再输入则取消注释
" <Leader>cm 以一个 /* */ 注释选中行(选中区域所在行)，再输入则称重复注释
" <Leader>cc 以每行一个 /* */ 注释选中行或区域，再输入则称重复注释
" <Leader>cu 取消选中区域(行)的注释，选中区域(行)内至少有一个 /* */
" <Leader>ca 在/*...*/与//这两种注释方式中切换（其它语言可能不一样了）
" <Leader>cA 行尾注释

let NERDSpaceDelims = 1

if has("cscope")
    set csprg=/usr/bin/cscope
    "如果你想反向搜索顺序设置为1
    set csto=0
    set cst
    set csverb
    set cspc=3
    " 在当前目录中添加任何数据库
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
