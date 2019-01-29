"################################################## 基本设置 ##################################################
"											.vimrc config 
"											author xuegangliu 
"											email lxghoney@163.com
"											https://github.com/xuegangliu
"############################################################################################################## 

""""""""""""""""""""""""""""""""""""""" 基本设置 start """"""""""""""""""""""""""""""""""""""""
" 设定默认解码 
set fenc=utf-8 
"set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936 

" 支持256色，使得vim配色支持终端
"set t_Co=256
set cursorcolumn
set cursorline

" C缩进
set smartindent 
set cindent

" 设置背景和字体
"colorscheme molokai
"set guifont=Source\ Code\ Pro\ 12 

" 不要使用vi的键盘模式，而是vim自己的 
"set nocompatible 

" history文件中需要记录的行数 
set history=1000 

" 在处理未保存或只读文件的时候，弹出确认 
set confirm

" 与windows共享剪贴板 
set clipboard+=unnamed 
 
" 侦测文件类型 
filetype off 
 
" 为特定文件类型载入相关缩进文件 
filetype indent on 
 
" 带有如下符号的单词不要被换行分割 
set iskeyword+=_,$,@,%,#,- 

" 语法高亮
syntax enable
syntax on 
 
"隐藏GUI的工具栏
set guioptions=P

" 不要备份文件 
set nobackup 

" 不要生成swap文件
setlocal noswapfile 
 
" 字符间插入的像素行数目 
set linespace=0 
 
" 在状态行上显示光标所在位置的行号和列号 
set ruler 
 
" 命令行（在状态行下）的高度，默认为1，这里是2 
set cmdheight=2 

" 使回格键（backspace）正常处理indent, eol, start等 
set backspace=indent,eol,start
 
" 允许backspace和光标键跨越行边界 
set whichwrap+=<,>,b,s,[,]
 
" 不让vim发出讨厌的滴滴声 
set noerrorbells 
 
" 高亮显示匹配的括号 
set showmatch 

" 匹配括号高亮的时间（单位是十分之一秒） 
set matchtime=5 
 
" 在搜索的时候忽略大小写 
"set ignorecase 
 
" 不要高亮被搜索的句子（phrases） 
set nohlsearch 
 
" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索） 
set incsearch 
 
" 光标移动到buffer的顶部和底部时保持3行距离,窗口滚动最小距离 
set scrolloff=3 
 
" 2为总显示最后一个窗口的状态行
" 设为1则窗口数多于一个的时候显示最后一个窗口的状态行；
" 0不显示最后一个窗口的状态行 
set laststatus=2 
 
" 继承前一行的缩进方式，特别适用于多行注释 
""set autoindent 

" 显示行号
set number
 
" 制表符为4 
set tabstop=4 
 
" 统一缩进为4 
set softtabstop=4 
set shiftwidth=4 
 
" 不要用空格代替制表符 
set noexpandtab 
 
" 不要换行 
" set nowrap 
" set sidescroll=10
 
" 在行和段开始处使用制表符 
set smarttab 


""""""""""""""""""""""""""""""""""""""" 基本设置 end """"""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""" others start """"""""""""""""""""""""""""""""""""""""
" Ctrl+A全选，Ctrl+C复制，Ctrl+V粘贴
map <C-A> ggvG$ 
imap <C-A> <Esc>ggvG$
vmap <C-C> "+y<Esc>
map <C-V> "+p
imap <C-V> <Esc>"+pa

" 括号等的自动匹配
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" 设置<leader>和<localleader>
let mapleader = ","
let maplocalleader = "."

" 可以折叠 
set foldenable 
set foldmethod=manual 
""""""""""""""""""""""""""""""""""""""" others start """"""""""""""""""""""""""""""""""""""""
