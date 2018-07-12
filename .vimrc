set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()


    Plugin 'gmarik/Vundle.vim'

    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin  'lervag/vimtex'

"markdown插件
    Plugin 'godlygeek/tabular' "语法高亮
    Plugin 'plasticboy/vim-markdown'
    Plugin 'iamcco/markdown-preview.vim'   "实时预览插件1
    "Plugin 'suan/vim-instant-markdown'      "实时预览插件2
    Plugin 'iamcco/mathjax-support-for-mkdp'
    "Plugin 'iamcco/markdown-preview.vim'

"设置配色
    "Plugin 'molokai'
    Plugin 'altercation/vim-colors-solarized'
    "Plugin 'jnurmine/Zenburn'

    
 "设置需要先安装ctags，见说明中的dependence： https://vimawesome.com/plugin/tagbar,
 "选择 Universal Ctags ，然后点击左下角github project，最后找到mac的安装方法
    Plugin 'majutsushi/tagbar'

"设置缩进指示线、和
    Plugin 'Yggdroot/indentLine'

    Plugin 'davidhalter/jedi-vim'


"设置括号自动补全，跳出括号等https://github.com/jiangmiao/auto-pairs
    Plugin 'jiangmiao/auto-pairs'
    "Plugin 'Raimondi/delimitMate'

"设置 Fugitive: Git 集成，强烈推荐！
    Plugin 'tpope/vim-fugitive'


"快速添加/修改成对的标签http://vimawesome.com/plugin/surround-vim
    Plugin 'tpope/vim-surround'

"设置注释
    Plugin 'scrooloose/nerdcommenter'

"This script allows you to compile and deploy Arduino (*.pde) sketches directly from Vim.
    "Plugin 'tclem/vim-arduino'

"vim中文文档插件, 直接输入:help 就可以调出来
    Plugin 'vimcn/vimcdoc'

"The NERD tree allows you to explore your filesystem and to open files and directories.    
    Plugin 'scrooloose/nerdtree'
    
"Development version of vim script #2115. Originally authored by Szabolcs Horvát, and extended by 
"Erich Heine and others (see below for a full list), this plugin exists to allow vim to replace the Processing IDE to develop sketches.   
    Plugin 'sophacles/vim-processing'

    
    
"快速定位项目文件夹内文件    
    Plugin 'ctrlpvim/ctrlp.vim'
    
"合并合并显示NERDTree和TagList
    "Plugin 'vim-scripts/winmanager'
"状态栏增强插件，可以让你的Vim状态栏非常的美观，同时包括了buffer显示条扩展smart tab line以及集成了一些插件。
    Plugin 'vim-airline/vim-airline'

"设置自动补全，有了youcomplete，就不需要syntastic了，而且后者在保存的时候需要较长时间才能完成，很慢。
    Plugin 'valloric/YouCompleteMe'
"补全插件,相比较youcomplete，功能少，速度慢，但是安装容易
    "Plugin 'Shougo/neocomplete.vim'


    "Plugin 'klen/python-mode'
"微信小程序
    Plugin 'chemzqm/wxapp.vim'
    Plugin 'othree/xml.vim'   "辅助编辑xml文件，自动添加匹配标签
    Plugin 'mattn/emmet-vim'  "快速生成xml和css

"微信小程序语法检查
"wxss语法检查
    Plugin 'stylelint/stylelint'
    let g:neomake_wxss_enabled_makers = ['stylelint']
"wxml语法检查
    Plugin 'htacg/tidy-html5'
    let g:neomake_wxml_enabled_makers = ['tidy']






call vundle#end()            " required
filetype plugin indent on    " required

let g:airline#extensions#tabline#enabled = 1


"map ESC to jk
inoremap jk <ESC>
"noremap jk <ESC>

nnoremap U <C-r>

"change word to uppercase, I love this very much, insert model required
"keep your cursor on the word and press <c-u> 
inoremap <C-u> <esc>gUiwea

"set clipboard 
set clipboard=unnamed

"set color
syntax on
syntax enable
set background=dark
"colorscheme molokai
"colorscheme Zenburn
let g:solarized_termcolor=256
colorscheme solarized



"set jedi  https://github.com/davidhalter/jedi-vim
"Jedi selects the first line of the completion menu: for a better typing-flow 
"and usually saves one keypress.
let g:jedi#popup_select_first = 0
"You can make jedi-vim use tabs when going to a definition 
let g:jedi#use_tabs_not_buffers = 1




" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" Leader
let mapleader = ","
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup  "从不备份"
"set bg=dark
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set confirm       " Need confrimation while exit
set shiftwidth=4
set expandtab       "设置tab  
set tabstop=4       "四个空格代表一个tab  
set sts=4  
set showmatch       "在输入括号时光标会短暂地跳到与之相匹配的括号处  
set autoindent      "设置自动缩进  
" set smartindent   "设置智能缩进  
"set nowrap          "设置自动换行  
set cc=80
set hlsearch        "设置搜索结果高亮
set textwidth=80
set fo+=t
"autocmd FileType * setlocal textwidth=80 formatoptions+=t 
set nu   "显示行数
" Enable folding  即在有缩进的地方开始折叠
set foldmethod=indent
set foldlevel=99
set mouse=a
" Enable folding with the spacebar
nnoremap <leader>f za
vnoremap <leader>f zf

set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175


" Set Vim help to Chinese and utf-8 encoding 
if version >= 603 
set helplang=cn 
set encoding=utf-8 
set fileencodings=utf-8,gb18030,gbk,big5
endif 


" 方法一：当光标一段时间保持不动了，就禁用高亮
"autocmd cursorhold * set nohlsearch
" 方法二：用快捷键切换高亮
"nnoremap <C-h> :call DisableHighlight()<cr>
"function! DisableHighlight()
    "set nohlsearch
"endfunc


" 显示代码文档结构
nmap <leader>1 :TagbarToggle<CR>


" *********************************************
" ctrlp 文件搜索
" *********************************************
let g:ctrlp_map = '<c-p>' 
"let g:ctrlp_cmd='CtrlP :pwd'
let g:ctrlp_cmd = 'CtrlP'
noremap <C-a> :CtrlP /yourdir/<CR>
let g:ctrlp_working_path_mode = 'ra'
" 设置过滤不进行查找的后缀名 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = 'find %s -type f' 


" *********************************************
" 分割布局相关
" *********************************************
set splitbelow
set splitright
"快捷键，ctrl+l切换到左边布局，ctrl+h切换到右边布局
"ctrl+k切换到上面布局，ctrl+j切换到下面布局
nnoremap <C-S-J> <C-W><C-J>
nnoremap <C-S-K> <C-W><C-K>
nnoremap <C-S-L> <C-W><C-L>
nnoremap <C-S-H> <C-W><C-H>

" resize current buffer by +/- 5 
nnoremap <right> :vertical resize -5<cr>
nnoremap <up> :resize +5<cr>
nnoremap <down> :resize -5<cr>
nnoremap <left> :vertical resize +5<cr>


" Numbers
set number
set numberwidth=5

"Insert or delete brackets, parens, quotes in pair. 
"http://www.vim.org/scripts/script.php?script_id=3599
let g:AutoPairsShortcutToggle = '<M-p>'


" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
"自动补全时，匹配最长子串，列出文件
set wildmode=list:longest,list:full

" 自动补全tab触发
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>





"================================Nerd Tree 设置========================
"Show hidden files in NerdTree
let NERDTreeShowHidden=1
"autopen NERDTree and focus cursor in new document
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p



let NERDChristmasTree=0
let NERDTreeWinSize=40
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
autocmd vimenter * if !argc() | NERDTree | endif " Automatically open a NERDTree if no files where specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if the only window left open is a NERDTree
map <F9> :NERDTreeToggle<cr>

nmap tj :NERDTreeToggle<cr>  
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')





"按F5运行python但是这个一键执行有一个小问题,由于quickfix的原因，不支持标准输入input()和raw_input()
"，只要代码中有这两个函数，100%卡死，目前这个问题貌似还无解。如果不用quickfix就可以支持输入，但是
"在终端中使用的话就是跳回终端输入和输出；使用macvim的话又会出现输出数据很多时就无法查看全部
"。由于我在写python是标准输入用的较少，就决定放使用quickfix来保证实用和美观。"

"map <leader>5 :call RunPython()<CR>
"function RunPython()
  "let mp = &makeprg
  "let ef = &errorformat
  "let exeFile = expand("%:t")
  "setlocal makeprg=python\ -u
  "set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  "silent make %
  "copen
  "let &makeprg = mp
  "let &errorformat = ef
"endfunction
nmap <leader>5  :!clear && python %<CR>

"=============================== ycm setting============================"
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf=0
let g:ycm_key_invoke_completion = '<C-/>'
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>


" 设置跳转到方法/函数定义的快捷键 
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR> 
" 触发补全快捷键 
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>'] 
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>'] 
let g:ycm_auto_trigger = 1 
" 最小自动触发补全的字符大小设置为 3 
let g:ycm_min_num_of_chars_for_completion = 3 
" YCM的previw窗口比较恼人，还是关闭比较好 
set completeopt-=preview 



"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 242



"多行注释快捷键映射更改
map <leader>e   <leader>ci <CR>
"可以看到折叠代码的介绍
let g:SimpylFold_docstring_preview=1
"我们希望避免出现多余的空白字符。可以让Vim帮我们标示出来，使其很容易发现并删除。
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/





"=====================================Markdown setting===================="
let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
" or
"let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
"let g:mkdp_path_to_chrome = "google-chrome"
    " path to the chrome or the command to open chrome(or other modern browsers)

    let g:mkdp_auto_start = 0
    " set to 1, the vim will open the preview window once enter the markdown
    " buffer

    let g:mkdp_auto_open = 0
    " set to 1, the vim will auto open preview window when you edit the
    " markdown file

    let g:mkdp_auto_close = 1
    " set to 1, the vim will auto close current preview window when change
    " from markdown buffer to another buffer

    let g:mkdp_refresh_slow = 0
    " set to 1, the vim will just refresh markdown when save the buffer or
    " leave from insert mode, default 0 is auto refresh markdown as you edit or
    " move the cursor

    let g:mkdp_command_for_global = 0
    " set to 1, the MarkdownPreview command can be use for all files,
    " by default it just can be use in markdown file

    let g:vim_markdown_conceal = 0
    "let g:vim_markdown_new_list_item_indent = 2

    "nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
    "imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
    "nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
    "imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode


"vim在item2中的insert的光标会变为细光标
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif



set tags=tags 
set tags+=./tags
" add new tags file
set tags+=/Users/yanxu/anaconda2/lib/python2.7/site-packages/tags
