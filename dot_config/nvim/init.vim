lua require('init')

" Map <Leader> key to space
"map <Space> <Leader>
let mapleader="\<Space>"

" Hard mode
nnoremap <Left>         :echoe "Use h"<CR>
nnoremap <Right>        :echoe "Use l"<CR>
nnoremap <Up>           :echoe "Use k"<CR>
nnoremap <Down>         :echoe "Use j"<CR>
nnoremap <Home>         :echoe "Use ^"<CR>
nnoremap <End>          :echoe "Use $"<CR>
nnoremap <PageDown>     :echoe "Use CTRL-f"<CR>
nnoremap <PageUp>       :echoe "Use CTRL-b"<CR>

" Normalize
set nocompatible " Disable vi-comptible mode
set backspace=indent,eol,start " Backspace behavior
set autoindent " Enable autoindent
set tabstop=4 " Set tab size
set shiftwidth=4
set autoread " Autoread external changes
set mouse=a " Set mouse on Neovim
set timeoutlen=3000 " Leader key timeout
syntax enable " Enable syntax highlighting
filetype plugin indent on " Enable filetype detection and indentation
set ruler " Enable ruler at bottom right corner (line number, column info)
set laststatus=2 " Enable statusline
set wildmenu " Enable completion menu in command mode
set scrolloff=3 " Number of lines always visible around the cursor
set sidescrolloff=5 " Number of columns always visible on horizontal scroll
set display+=lastline " ???
set encoding=utf-8
set formatoptions+=j
set history=10000
set tabpagemax=50
set hls " Enlable highliting of all occurences in seach
set incsearch " Enable incremental search
set nowrap " Disable word wrap
set foldmethod=marker
set bg=dark
set tgc " 24-color support

" Move in insert/command mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Autoswitch keyboard layout on insert mode
function! KeyboardLayoutCmdlineEnter()
    let g:kb_layout_cmdline_mode_leave=system('im-switch -p')
    if exists('g:kb_layout_cmdline_mode_enter')
        call system(printf("im-switch -s '%s'", g:kb_layout_cmdline_mode_enter))
    else
        let g:kb_layout_cmdline_mode_enter=system('im-switch -p')
    endif
endfunction

function! KeyboardLayoutCmdlineLeave()
    let g:kb_layout_cmdline_mode_enter=system('im-switch -p')
    if exists('g:kb_layout_cmdline_mode_leave')
        call system(printf("im-switch -s '%s'", g:kb_layout_cmdline_mode_leave))
    else
        let g:kb_layout_cmdline_mode_leave=system('im-switch -p')
    endif
endfunction

function! KeyboardLayoutInsertEnter()
    let g:kb_layout_insert_mode_leave=system('im-switch -p')
    if exists('g:kb_layout_insert_mode_enter')
        call system(printf("im-switch -s '%s'", g:kb_layout_insert_mode_enter))
    else
        let g:kb_layout_insert_mode_enter=system('im-switch -p')
    endif
endfunction

function! KeyboardLayoutInsertLeave()
    let g:kb_layout_insert_mode_enter=system('im-switch -p')
    if exists('g:kb_layout_insert_mode_leave')
        call system(printf("im-switch -s '%s'", g:kb_layout_insert_mode_leave))
    else
        let g:kb_layout_insert_mode_leave=system('im-switch -p')
    endif
endfunction

aug AutoSwitchKeyboardLayout
    au!
    au CmdlineEnter * call KeyboardLayoutCmdlineEnter()
    au CmdlineLeave * call KeyboardLayoutCmdlineLeave()
    au InsertEnter * call KeyboardLayoutInsertEnter()
    au InsertLeave * call KeyboardLayoutInsertLeave()
aug END

if !exists('g:vscode')

    " toggle word wrap
    nnoremap <leader>p :set wrap!<cr>
    " toggle 24-bit color support
    nnoremap <leader>t :set tgc!<CR>

    " highlight the search match in red
    highlight WhiteOnRed ctermbg=red ctermfg=white guibg=red guifg=white
    function! HLNext (blinktime)
        let ring = matchadd('WhiteOnRed', '\c\%#\%('.@/.'\)', 101)
        redraw
    endfunction
    " This rewires n and N to do the highlighing...
    nnoremap <silent> n n:call HLNext(0.4)<cr>
    nnoremap <silent> N N:call HLNext(0.4)<cr>

    " Use <C-L> to clear the highlighting of :set hlsearch.
    if maparg('<C-L>', 'n') ==# ''
      nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
    endif

    " Relative/Absolute line numbering toggle (NORMAL/INSERT modes respectively)
    set number relativenumber
    augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END

    " Show invisibles
    set list
    set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯
    highlight NoneText guifg=#acbecf ctermfg=1
    highlight SpecialKey guifg=#acbecf ctermfg=1

    " Switch to ru keymap using <C-6> (see also, xkb-switch plugin)
    set keymap=russian-jcukenwin
    set iminsert=0
    set imsearch=0

    " Persistent undo
    if has('persistent_undo')
        set udf
        if !has('win32') && exists('$XDG_DATA_HOME')
            set udir=$XDG_DATA_HOME/nvim/undo
        endif
    endif

    " Alias :Wq to :wq
    command! Wq wq

    " Save with Ctrl+S
    noremap <C-S> :update<CR>
    vnoremap <C-S> <ESC>:update<CR>gv
    inoremap <C-S> <C-O>:update<CR>

    " Highlight column that exceeds 120 width
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%121v', 100)

"     " Use OSC-52 to copy/paste
"     let g:clipboard = {
"                 \ 'name': 'oscClipboard',
"                 \ 'copy': {
"                 \   '+': 'osc52-copy c',
"                 \   '*': 'osc52-copy s',
"                 \ },
"                 \ 'paste': {
"                 \   '+': 'osc52-paste c',
"                 \   '*': 'osc52-paste s',
"                 \ },
"                 \ 'cache_enabled': 1,
"                 \ }

    " DISABLED netrw IN FAVOR OF NERDTree
    "" netrw as NERDTree
    "let g:netrw_banner = 0
    "let g:netrw_liststyle = 3
    "let g:netrw_browse_split = 4
    "let g:netrw_altv = 1
    "let g:netrw_winsize = 15
    "
    "" netrw toggle
    "let g:NetrwIsOpen=0
    "function! ToggleNetrw(cwd)
    "	if g:NetrwIsOpen
    "		let i = bufnr("$")
    "		while (i >= 1)
    "			if (getbufvar(i, "&filetype") == "netrw")
    "				silent exe "bwipeout " . i
    "			endif
    "			let i-=1
    "		endwhile
    "		let g:NetrwIsOpen=0
    "	else
    "		let g:NetrwIsOpen=1
    "		if (a:cwd)
    "			silent Lexplore
    "		else
    "			silent Vexplore
    "		endif
    "	endif
    "endfunction
    "noremap <silent> <C-Bslash> :call ToggleNetrw(1)<CR>
    "noremap <silent> <C-_> :call ToggleNetrw(0)<CR>

else
    " config for vscode
endif

let plug_dir = stdpath('data') . '/site/autoload/plug.vim'
if empty(glob(plug_dir))
    silent execute '!curl -fLo ' . plug_dir . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'chaoren/vim-wordmotion'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wikitopian/hardmode'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'thinca/vim-visualstar'

if !exists('g:vscode')
    Plug 'junegunn/vim-plug'
    Plug 'farmergreg/vim-lastplace'
    Plug 'junegunn/vim-peekaboo'
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'easymotion/vim-easymotion'
    " Plug 'phaazon/hop.nvim'
    Plug 'dense-analysis/ale'
    Plug 'ojroques/vim-oscyank'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'psliwka/vim-smoothie'
else
    " plugins for vscode
    Plug 'asvetliakov/vim-easymotion', { 'as': 'vsc-easymotion' }
endif

call plug#end()

" Wordmotion prefix key
let g:wordmotion_prefix = '<Leader>'

" Highlightedyank duration
let g:highlightedyank_highlight_duration = 300

" Hard mode toggle
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Easymotion
let g:EasyMotion_keys = 'fjdksla;ghrueiwoqptyvmzxcbn'

if !exists('g:vscode')
    " palenight colorscheme
    colorscheme palenight
    if $TERM =~? '^\(dumb\|linux\)$'
        set notgc " 8-color format
        let g:palenight_termcolors = 16
        let g:palenight_terminal_italics = 0
    else
        set tgc " 24-color support
        let g:palenight_termcolors = 256
        let g:palenight_terminal_italics = 1
        " unset background color for transparency to work and more consistent
        " look compared to terminal
        hi Normal guibg=NONE
    endif
    " fzf
    inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
    command! -bang HFiles call fzf#run(fzf#wrap({'source': 'fd -HI', 'sink': 'e'}, <bang>0))
    command! -bang Files call fzf#run(fzf#wrap({'source': 'fd -I', 'sink': 'e'}, <bang>0))

    " ALE config
    let g:ale_python_flake8_options = '--max-line-length=119'
    let g:ale_fixers = {
                \   'python': ['isort', 'autopep8'],
                \}

    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)
    nmap <silent> <leader>f <Plug>(ale_fix)

    " OSC52 yank
    vnoremap <leader>c :OSCYank<CR>
    nnoremap <leader>c <Plug>OSCYank
endif
