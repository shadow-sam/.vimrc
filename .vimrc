"==============================Vundle配置==================================
set nocompatible							"关闭vi兼容模式
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'					"vim配色gruvbox
Plugin 'vim-airline/vim-airline'			"状态栏插件
Plugin 'vim-airline/vim-airline-themes'		"状态栏配色插件

Plugin 'vim-scripts/taglist.vim'			"taglist
Plugin 'scrooloose/nerdtree'				"nerdtree

"Plugin 'wesleyche/SrcExpl'					"source insight预览框
Plugin 'Valloric/YouCompleteMe'			    "代码补全

call vundle#end()
filetype plugin indent on					"使能插件

"===============================基本设置===================================
"----------------首要设置------------
set t_Co=256								"设置256色

" ---------------通用设置------------
syntax on									"语法高亮
set history=1000							"设置历史记录条数
set number									"显示行号
set mouse=a									"开启鼠标点击定位
set hlsearch								"高亮搜索

set tabstop=4								"设置tab长度为4
set expandtab								"用空格代替tab

set fdm=marker								"设置marker折叠方式

set noautoindent
set shiftwidth=4                            "设置缩进空格数为4
set cindent                                 "设置为C/C++缩进方式

"---------------vim主题配置----------
set background=dark                         " 设置vim背景为深色
set cursorline                              " 突出显示当前行
set cursorcolumn                            " 突出显示当前列
colorscheme gruvbox                         " 设置gruvbox主题
"hi CursorLine cterm=NONE ctermbg=237 ctermfg=NONE
"hi CursorColumn cterm=NONE ctermbg=237 ctermfg=NONE

"=================================插件配置==================================
"--------------状态栏配色--------------
let g:airline_theme='base16'

"--------------taglist----------------
nnoremap <silent> <F8> :TlistUpdate<CR>			"更新taglist window
nnoremap <silent> <F9> :TlistToggle<CR>			"开、关taglist window
let Tlist_Auto_Open=1							"启动vim后自动打开taglist
let Tlist_Use_SingleClick=1						"鼠标单击tag就跳转
let Tlist_Exit_OnlyWindow=1						"仅剩taglist时关闭vim
let Tlist_Show_One_File=1						"只显示当前文件的tags

"--------------nerdtree----------------
map <F10> :NERDTreeToggle<CR>					"开、关nerdtree
let NERDTreeWinPos="right"

"--------------SrcExpl----------------
"nmap <F11> :SrcExplToggle<CR>					"开、关SrcExpl

"---------------cscope---------------
"find $PWD -regex ".*\.\(h\|c\|cpp\|htm\|html\|js\|css\)$" > cscope.files
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
	set cst
    set nocsverb
    " add any database in current directory"
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

nmap fs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap fg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap fc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap ft :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap fe :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap fd :cs find d <C-R>=expand("<cword>")<CR><CR>



