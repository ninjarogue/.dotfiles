<<<<<<< HEAD





call plug#begin()

Plug 'asvetliakov/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'

call plug#end()





highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Easymotion config
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

let mapleader = " "









" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Enable True Color Support (ensure you're using a 256-color enabled $TERM, e.g. xterm-256color)
set termguicolors
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set relativenumber
set noswapfile
set undofile
set encoding=utf-8
set hidden
set number
set title
set timeoutlen=300
set clipboard=unnamedplus





if !exists('g:vscode')
    nnoremap <leader>s :w<CR>
    nnoremap <leader>j J
    nnoremap <C-s> :source $MYVIMRC<CR>
    nnoremap <leader>q :q<CR>

else

    function! s:vscodeCommentary(...) abort
        if !a:0
            let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
            return 'g@'
        elseif a:0 > 1
            let [line1, line2] = [a:1, a:2]
        else
            let [line1, line2] = [line("'["), line("']")]
        endif

        call VSCodeCallRange("editor.action.commentLine", line1, line2, 0)
    endfunction





    function! s:openVSCodeCommandsInVisualMode()
        normal! gv
        let visualmode = visualmode()
        if visualmode == "V"
            let startLine = line("v")
            let endLine = line(".")
            call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
        else
            let startPos = getpos("v")
            let endPos = getpos(".")
            call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
        endif
    endfunction

    " Better Navigation
    nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
    xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>

    nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
    xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>

    nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
    xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>

    nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
    xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

    nnoremap <silent> H :call VSCodeNotify('workbench.action.previousEditor')<CR>
    nnoremap <silent> L :call VSCodeNotify('workbench.action.nextEditor')<CR>
    nnoremap <leader>s :call VSCodeNotify('workbench.action.files.save')<CR>
    nnoremap <leader>j :call VSCodeNotify('editor.action.joinLines')<CR>
    nnoremap <leader>wo :call VSCodeNotify('workbench.action.closeOtherEditors')<CR>
    nnoremap <leader>wl :call VSCodeNotify('workbench.action.closeEditorsToTheRight')<CR>
    nnoremap <leader>wh :call VSCodeNotify('workbench.action.closeEditorsToTheLeft')<CR>

    nnoremap <leader>gb :call VSCodeNotify('gitlens.views.branches.focus')<CR>
    nnoremap ? :call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
    nnoremap <leader>gp :call VSCodeNotify('gitlens.pushRepositories', { 'query': expand('<cword>')})<CR>
    " VSCode commands with NeoVim selection
    xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>

    nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
    " Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
    xnoremap <expr> <leader>/ <SID>vscodeCommentary()
    nnoremap <expr> <leader>/ <SID>vscodeCommentary() . '_'

    nnoremap <expr> <leader>cs :call VSCodeNotify('git.commitStaged')<CR>
endif





nnoremap <C-n> :nohlsearch<CR>

nnoremap $ g_
nnoremap 0 _

inoremap jj <C-o>i
inoremap kk  <C-o>a

nnoremap U <C-r>
nnoremap J mzyyp`z
nnoremap K mzyyP`z
nnoremap <M-j> :m .+1<cr>==
nnoremap <M-k> :m .-2<cr>==
nnoremap Y yg_

inoremap jj <C-o>a
inoremap kk <C-o>h
inoremap kj <ESC>

vnoremap <silent> < <gv
vnoremap <silent> > >gv
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
" add newline
nnoremap <silent> oo mzo<Esc>`z
nnoremap <silent> OO mzO<Esc>`z

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

xnoremap <leader>p "_dP
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap q <Nop>

















