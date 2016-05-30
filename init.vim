set nocompatible

" Pathogen
execute pathogen#infect()
Helptags

" Share clipboard
set clipboard=unnamed

filetype plugin indent on
set exrc
set tags=tags
set autochdir
autocmd BufEnter * silent! lcd %:p:h
autocmd BufEnter * let &titlestring = expand('%:t')
set title titlestring=expand('%:t') titlelen=70

"-----------------------------------------------------------------------------
" Formatting, Search & Spell
"-----------------------------------------------------------------------------
set wildmode=longest,list
set backspace=indent,eol,start
syntax enable
syntax on
set number
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

set nowrapscan
set noincsearch
set hlsearch
set ruler

set spelllang=fr
set lbr
set timeout timeoutlen=1000 ttimeoutlen=10


"-----------------------------------------------------------------------------
" Mutt
"-----------------------------------------------------------------------------
au BufRead /tmp/mutt-* set tw=72


"-----------------------------------------------------------------------------
" Vim Calendar
"-----------------------------------------------------------------------------
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:calendar_time_zone = "+0200"
let g:calendar_first_day = "monday"

"-----------------------------------------------------------------------------
" Keyboard
"-----------------------------------------------------------------------------
" control leader
let mapleader="-"
let maplocalleader = "\\"

nmap <C-G> <Esc>
imap <C-G> <Esc>
vmap <C-G> <Esc>
cmap <C-G> <Esc>
omap <C-G> <Esc>

nmap <C-W><C-W> <C-W><C-P>
imap <C-W><C-W> <C-W><C-P>
vmap <C-W><C-W> <C-W><C-P>
cmap <C-W><C-W> <C-W><C-P>
omap <C-W><C-W> <C-W><C-P>

" ctrl + D remove lines
nmap <c-d> "_dd<Esc>
vmap <c-d> "_dd<Esc>
imap <c-d> <End><c-u>

" indent
"nmap < <<
"nmap > >>

" shift+arrow (ne marche pas avec xfce4)
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>
" shift+arrow jklm
nmap <S-k> v<Up>
nmap <S-j> v<Down>
nmap <S-h> v<Left>
nmap <S-l> v<Right>
vmap <S-k> <Up>
vmap <S-j> <Down>
vmap <S-h> <Left>
vmap <S-l> <Right>

" utiliser Shift-home et Shift-end
inoremap <S-Home> <c-\><c-O>vg0<c-G>
inoremap <S-End> <c-\><c-O>vg$<c-G>
nnoremap <S-Home> vg0<c-G>
nnoremap <S-End> vg$<c-G>

" ctrl+c et ctrl+v
vmap <c-c> "+ygv
vmap <c-v> c<ESc>"+p
imap <c-v> <c-r><c-o>+

"Unmap scroll wheel
nmap <S-ScrollWheelUp> <nop>
nmap <C-ScrollWheelUp> <nop>
nmap <S-ScrollWheelDown> <nop>
nmap <C-ScrollWheelDown> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelLeft> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <C-ScrollWheelRight> <nop>

" Map avec gT mais pour gB
nmap gb :bn<CR>
nmap gB :bp<CR>

" Highlight word
map <2-leftmouse> <Leader>m

" Escape terminal with espace
tnoremap <leader>< <C-\><C-n>


"-----------------------------------------------------------------------------
" Macros
"-----------------------------------------------------------------------------
" sudo w
noremap <Leader>w :w !sudo tee % > /dev/null<cR>

" reverse text
vnoremap ;rv c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>

" NerdTree
map <F5> :NERDTreeToggle<CR>

"Language Tool
let g:languagetool_jar='/home/jfaucon/Program/LanguageTool/LanguageTool-2.7/languagetool-commandline.jar'
let g:languagetool_lang='fr'
let g:languagetool_disable_rules='WHITESPACE_RULE,EN_QUOTES,FRENCH_WHITESPACE'

" Swap to word
nmap <silent> gw "_yiw:s/\(\%#[azertyuiopqsdfghjklmwxcvbnAZERTYUIOPQSDFGHJKLMWXCVBNéèàÉÈÀ1234567890_-]\+\)\( et \\|\_W\+\)\([azertyuiopqsdfghjklmwxcvbnAZERTYUIOPQSDFGHJKLMWXCVBNéèàÉÈÀ1234567890_-]\+\)/\3\2\1/<CR><C-o>:noh<CR>
noh

noremap <silent> <Leader>w :call ToggleWrap()<CR>
let @v=0
function! ToggleWrap()
    if @v
        echo "Wrap OFF"
        silent! nunmap <Up>
        silent! nunmap <Down>
        silent! nunmap <Home>
        silent! nunmap <End>
        silent! iunmap <Up>
        silent! iunmap <Down>
        silent! iunmap <Home>
        silent! iunmap <End>
        silent! nunmap j
        silent! nunmap k
        silent! nunmap <Home>
        silent! nunmap <End>
        silent! iunmap <Up>
        silent! nunmap $
        silent! unmap $
        silent! nunmap ^
        silent! unmap ^
        silent! iunmap <Down>
        silent! iunmap <Home>
        silent! iunmap <End>

        let @v=0
    else
        echo "Wrap ON"
        noremap j gj
        noremap k gk
        noremap $ g$
        noremap ^ g^
        let @v=1
    endif
endfunction


" Spell
noremap <silent> <Leader>s :call ToggleSpell()<CR>
let @x=0
function!  ToggleSpell()
    if @x
        echo "SpellBad OFF"
        hi SpellBad ctermfg=none ctermbg=none
        let @x=0
    else
        echo "SpellBad ON"
        hi SpellBad ctermfg=16 ctermbg=229 gui=undercurl
        let @x=1
    endif
endfunction


" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap <Leader>z :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
let @/ = ''
if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
            setl updatetime=100
            echo 'Highlight current word: ON'
            return 1
        endif
endfunction


"-----------------------------------------------------------------------------
" Latex
"-----------------------------------------------------------------------------

let g:vimtex_fold_enabled=0
let g:latex_fold_automatic=0

"-----------------------------------------------------------------------------
" Status line
"-----------------------------------------------------------------------------
set laststatus=2
set statusline=%f\ -\ ft:\ %y
set statusline+=[%{strlen(&fenc)?&fenc:'ascii'}] "file encoding
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines


"-----------------------------------------------------------------------------
" Colorscheme
"-----------------------------------------------------------------------------
if $TERM=~'xterm-256color'
    colorscheme mayansmoke
    highlight Normal ctermbg=white ctermfg=black
endif


"-----------------------------------------------------------------------------
" Languages
"-----------------------------------------------------------------------------
au BufRead,BufNewFile *.cpp		set filetype=cpp
au BufRead,BufNewFile *.py		set filetype=python


"-----------------------------------------------------------------------------
" Shell
"-----------------------------------------------------------------------------
" For Nvim-R
inoremap <Nul> <C-x><C-o>
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

let g:neoterm_repl_command = "clear"
let g:neoterm_size = 10

nnoremap <silent> ,th :call neoterm#close()<cr>
nnoremap <silent> ,tk :call neoterm#kill()<cr>
nnoremap <silent> ,tc :call neoterm#clear()<cr>

function! ExecFile(mycmd)
    call neoterm#do(a:mycmd)
endfunction

function! ExecLine()
    let mycmd = getline('.')
    "echo "Exec" . mycmd
    if(mycmd != "")
        call neoterm#do(mycmd)
        silent!  execute "normal! /^\\S\<cr>"
    else
        silent!  execute "normal! /^\\S\<cr>"
    endif
endfunction

