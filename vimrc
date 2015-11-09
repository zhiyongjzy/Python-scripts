set nu

set nocompatible

set mouse=a

"TAB键的宽度
set tabstop=4 

"统一缩进为4
set shiftwidth=4
set softtabstop=4

"开启三种只能模式, 自动识别文件类型，用文件类型plugin脚本,编辑缩进定义文件
filetype plugin indent on

"不要用空格代替制表符
set noexpandtab

"在处理未保存或只读文件的时候， 弹出确认
set confirm

"自动缩进
set autoindent
set smartindent

"设置C/C++语言的自动缩进方式
set cindent
set cinoptions=g0

"查找时不考虑大小写
set ic   "ignorecase

"设置标题为当前编辑的文件
set title

"C++中public等输入冒号之后顶格
set cinoptions=g0

"高亮搜索结果
"set hlsearch

"搜索时输入过程中就开始搜索
set incsearch

"设置命令行高度
"set cmdheight=2

"自动保存（不是 按时间自动保存，而是当需要时）
set autowrite

"设置当文件被改动时自动载入
set autoread

"状态行显示的内容
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}     



"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.c,*.h,*.sh,*.java exec ":call SetTitle()" 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+2, "\#########################################################################") 
		call append(line(".")+3, "\#!/bin/bash") 
		call append(line(".")+4, "") 
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+2, " ************************************************************************/") 
		call append(line(".")+3, "")
	endif
	if &filetype == 'c'
		call append(line(".")+4, "#include <stdio.h>")
		call append(line(".")+5, "")
	endif
"".h 文件进cpp ？？？？？？？？？？？？？？
	if &filetype == 'cpp'
		call append(line(".")+4, "#pragma once")
		call append(line(".")+5, "")
	endif


""	if &filetype == 'cpp'
""		call append(line(".")+4, "#include <iostream>")
""		call append(line(".")+5, "using namespace std;")
""		call append(line(".")+6, "")
""	endif
		if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%"))
			call append(line(".")+7,"")
		endif
endfunc 
autocmd BufNewFile * normal G  "新建文件后光标移动到文件结尾




""set rtp+=~/.vim/bundle/vundle/
""call vundle#rc()

" let Vundle manage Vundle
" required! 
""'Bundle 'gmarik/vundle'

" 可以通过以下四种方式指定插件的来源
" a) 指定Github中vim-scripts仓库中的插件，直接指定插件名称即可，插件明中的空格使用“-”代替。
""Bundle 'L9'

"" b) 指定Github中其他用户仓库的插件，使用“用户名/插件名称”的方式指定
""Bundle 'tpope/vim-fugitive'
""Bundle 'Lokaltog/vim-easymotion'
""Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
""Bundle 'tpope/vim-rails.git'

" c) 指定非Github的Git仓库的插件，需要使用git地址
""Bundle 'git://git.wincent.com/command-t.git'

" d) 指定本地Git仓库中的插件
""Bundle 'file:///Users/gmarik/path/to/plugin'

""filetype plugin indent on     " required!
