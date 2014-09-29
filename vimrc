""""""""""""""""""""""""""""""""""""""
" 编辑器设置
""""""""""""""""""""""""""""""""""""""
"vundle  -- vim package manager
"
"
"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
"
"    " My Bundles here:
"     "
"      " original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"开启语法高亮
syntax enable
syntax on

"配色
colors desert 
"设置高亮搜索
set hlsearch
set mouse-=a
"设置菜单语言为英文
set langmenu=en_US
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1 
set termencoding=utf-8 
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"source cscope_maps.vim


" 去掉输入错误的提示声音
set noeb

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 不要用空格代替制表符
"set noexpandtab

" 用空格代替制表符
set et

"显示行号
set number

"Tab 宽度
set ts=4

"自动缩进
set sw=4

"禁止生成临时文件
set nobackup
set noswapfile

"搜索忽略大小写
set ignorecase

" 总是显示状态行
" set laststatus=2

"C/C++ 风格的自动缩进
set cin
"设定 C/C++ 风格自动缩进的选项
set cino=:0g0t0(sus

"打开普通文件类型的自动缩进
set ai

"在编辑过程中，在右下角显示光标位置的状态行
set ruler

"显示匹配括号
set showmatch

"在insert模式下能用删除键进行删除
set backspace=indent,eol,start

"代码折叠, 命令 za
"set foldmethod=syntax
set foldmethod=indent
set foldlevel=100  "启动vim时不要自动折叠代码

"设置字体 
set guifont=courier\ 10

"自动换行
set autoindent

"设置编码
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set langmenu=utf-8
set enc=utf-8
set fenc=utf-8
set fencs=utf-8

"隐藏菜单栏
set guioptions-=m
set guioptions-=T

""""""""""""""""""""""""""""""""""""""
" 快捷键设置
""""""""""""""""""""""""""""""""""""""

"当前目录生成tags语法文件，用于自动完成，函数提示：code_complete.vim OmniCppComplete.vim ...
"map <F5> :!ctags -R --c-kinds=+p --fields=+S . <CR>
"map <F5> :!ctags -R --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q . <CR>

"函数和变量列表
map <F6> :TlistToggle<CR> 

"文件树状列表
map <F8> :NERDTree<CR> 

"映射复制、粘贴、剪贴ctrl+c ctrl+v ctrl+x
"map <C-V> "+pa<Esc>
"map! <C-V> <Esc>"+pa
"map <C-C> "+y
"map <C-X> "+x

" 映射全选 ctrl+a
map <C-A> ggVG
map! <C-A> <Esc>ggVG

"下面6个映射用于在不退出输入模式的情况下移动光标
"具体方法就是同时按下ctrl和光标移动键(h or j or k or l)
"crtl-b，ctrl-w等同于normal模式下的b和w（前移一个单词和后移一个单词）
"注意，ctrl-h在输入模式下默认等同于backspace键（这和在shell下是一样的）
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
imap <C-e> <C-o>e
imap <C-b> <C-o>b
imap <C-w> <C-o>w

" 多行缩进
map <Tab> >
map <S-Tab> <

"全屏
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

"F1 后退 
"F2 前进 
"noremap <F1> <C-o>   
"noremap <F2>  <Tab>   

"F7 编译
"map   <F7>   :call Compile()<CR>
function! Compile()
    copen<CR>	<C-W>10_ 
    exec "w"
    exec "!g++ -g % -o %<"
endfunction

"F5 调试
"map   <F5>   :call Debug()<CR>
function! Debug()
    copen<CR>	<C-W>10_ 
    exec "w"
    exec "!gdb %<"
endfunction

"CTRL-s    保存（保持当前模式不变） 
"CTRL-o    打开文件对话框
"noremap <C-s> :w<CR>   
"noremap! <C-s> <ESC><ESC>:w<CR>a   
"inoremap <C-o> :browse tabnew<CR>:cd %:p:h<CR>   

"Tab       跳至下一窗口 
"SHIFT-Tab 跳至上一窗口
noremap <Tab> <C-W>w:cd %:p:h<CR>:<CR>   
noremap <S-Tab> <C-W>W:cd %:p:h<CR>:<CR> 
noremap <CR> <ESC><ESC>za
""""""""""""""""""""""""""""""""""""""
" 插件设置
""""""""""""""""""""""""""""""""""""""
"开启OmniCppComplete.vim
"set nocp
"filetype plugin on
"设置当用户预先声明namespace时也能自动补全代码（如使用using std::string）
"let OmniCpp_DefaultNamespaces = ["std"]
"set completeopt=longest,menu

"2Html插件，启用XHtml css
"let html_number_lines=1
"let html_use_css=1
"let use_xhtml=1

"fencview.vim 插件设置
"let g:fencview_autodetect = 1  "打开文件时自动识别编码
"let g:fencview_checklines = 10 "检查前后10行来判断编码

"autocomplpop.vim 插件设置
"let g:AutoComplPop_IgnoreCaseOption=1
set ignorecase

" vimgdb setting
"let g:vimgdb_debug_file = ""
"run macros/gdb_mappings.vim 

"""""""""""""""""""""""""""""""""""""""""""

""python编程相关
if has("autocmd")
    filetype plugin indent on

    " Python 文件的一般设置，比如不要 tab 等
    autocmd FileType python set foldmethod=indent
    autocmd FileType python set cinwords=if,elif,else,for,while,try,except,finally,def,class
endif

" doxgen 
let g:doxygenToolkit_authorName="myemal"
let g:doxygenToolkit_briefTag_funcName="yes"

"for snippetEmu
let g:snip_set_textmate_cp=1
"set cursorline
" EnhanceCommentify
map <F2> <Esc><Esc>:call EnhancedCommentify('yes','comment')<CR>
map <F3> <Esc><Esc>:call EnhancedCommentify('yes','decomment')<CR>
set clipboard=unnamed
"cscope
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:vimrc_iswindows=1
else
    let g:vimrc_iswindows=0
endif
autocmd BufEnter * lcd %:p:h
map <F12> :call Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        let tagsdeleted=delete("./"."tags")
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        let csfilesdeleted=delete("./"."cscope.files")
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        let csoutdeleted=delete("./"."cscope.out")
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        silent! execute "!cscope -bq"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction
set nocscopeverbose
