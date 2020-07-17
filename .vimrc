"==============================================================================
" vim 配置 zouchao 2020-03-26
"==============================================================================

" 自动加载vim配置文件，不用重新打开，及时生效
" 建议配置完后'关闭'，否则配置多了会很卡
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

set nocompatible " 关闭兼容模式
set number "显示行号
set numberwidth=4
set nobackup " 不备份文件
set noswapfile " 不生成swp临时交换文件
set nowritebackup " 编辑的时候不需要备份文件
" set cursorline " 突出显示当前行
" set cursorcolumn " 突出显示当前列，影响美观，O(∩_∩)O~
set laststatus=2 " 显示/隐藏状态行, 0 不显示

" tabstop 定义一个tab等于多少个空格
" shiftwidth 程序自动缩进的空白宽度
" softtabstop，自己google太多了懒得写
" tabstop = ts, sw = shiftwidth, sts = softtabstop, tw = textwidth, et = expandtab
set tabstop=4
set shiftwidth=4
set autoindent " smartindent, cindent
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:.

set isk+=- "把-分割的单词视为一个整体
set showmatch " 显示括号匹配
set incsearch "开启实时搜索
set ignorecase " 搜索时大小写不敏感

filetype plugin indent on    " 启用自动补全
" 保存时移除行尾空格
" Wanna know more? http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * :%s/\s\+$//e

" 文件编码
set enc=utf-8
set fenc=utf-8 " default fileencoding
set fencs=ucs-bom,utf-8,gb18030,gbk,gb2312,cp936,big5,euc-jp,euc-kr,latin1

" 退出插入模式指定类型的文件自动保存
" au InsertLeave *.go,*.sh,*.php write

set nofixendofline " 不去修复尾行，避免git diff出现No newline at end of file
set vb t_vb= " Disable bell in MacVim
set updatetime=100 " 单位ms, 默认4000ms，太慢了

set textwidth=80 " 单行80个字符做一个分割线
set colorcolumn=+1,121

" -----------------------------------
" 撤销、重做
" -----------------------------------
set undodir=~/.vim/tmp/undo//     " undo files
set undofile
set undolevels=1000         "maximum number of changes that can be undone
set undoreload=10000        "maximum number lines to save for undo on a buffer reload

" -----------------------------------
" 根据不同文件设定不同的tab间距
" -----------------------------------
autocmd FileType ruby,yaml,eruby setlocal ts=2 sw=2 sts=2 et
autocmd FileType htm,html,php setlocal ts=4 sw=4 sts=4 et nolist
autocmd FileType go,ini,toml setlocal ts=4 sw=4 sts=4 nolist

" 记住上次光标位置
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" -----------------------------------
" 公共快捷键
" -----------------------------------

" 定义快捷键的前缀，即<Leader>
let mapleader=" "

" 复制内容到系统剪切板
vnoremap <Leader>y "*y
nnoremap <Leader>p "*p

" tabs and windows {{{
  " Switch between tab 1 ~ 9
  for i in range(1, 9)
      exec "nnoremap \\".i." ".i."gt"
  endfor
  nnoremap \0 :tablast<cr>
  nnoremap \t :tab split<CR>
  nnoremap \T :tabnew<CR>
  nnoremap <Leader>d :bd<CR>
  " 快速切换缓冲区
  nnoremap <Leader><Leader> <c-^>

  " 分屏
  " set splitright
  " set splitbelow
" }}}

" 作用和上面一样，只不过是使用的 Leader
nmap <Leader>h <C-w>h
nmap <Leader>l <C-w>l
nmap <Leader>k <C-w>k
nmap <Leader>j <C-w>j

" 手动缩进
nnoremap <tab> v<
nnoremap > v>
vnoremap < <gv
vnoremap > >gv

" 切换粘贴模式
set pastetoggle=<F6>

"输入模式和命令行模式下 control 加a或者e，移动光标到前后
inoremap <C-A>  <C-O>^
inoremap <C-E>  <End>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" 编辑vim配置/加载
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>q :qa!<cr>
" 缩写
iabbrev xname ZouChao
iabbrev xmail <zouchao2008@gmail.com>
iabbrev xfile <c-r>=expand("%:t")<CR>
if exists("*strftime")
    iabbrev xdate <c-r>=strftime("%Y-%m-%d")<CR>
    iabbrev xtime <c-r>=strftime("%H:%M:%S")<CR>
    iabbrev xdtime <c-r>=strftime("%F %T")<CR>
endif

" -----------------------------------
" 加载vim插件文件
" -----------------------------------
if filereadable(expand("~/.vimconf/.vimrc.plug"))
  source ~/.vimconf/.vimrc.plug
endif

if filereadable(expand("~/.vimconf/.defx.vim"))
	source ~/.vimconf/.defx.vim
endif

" 主题选择
colorscheme one
set background=dark
set termguicolors
syntax on                    " 开启文件类型侦测
