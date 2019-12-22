" Reload config: :so %
" Install packages: :PlugUpdate / :PlugInstall
" Remove packages: :PlugClean

set nocompatible
syntax enable

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/seoul256.vim'

call plug#end()

" GLOBAL SETTINGS
:set tabstop=2 shiftwidth=2 expandtab
:set nu "line numbers
:set ma
:set clipboard+=unnamedplus
" NOT SURE - remove?
"let python_highlight_all=1
"syntax on

" PLUGIN THEME - SEOUL256
colo seoul256
set background=dark

"PLUGIN - ale
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\    'typescript': ['prettier'],
\    'vue': ['prettier'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}


"PLUGIN - NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"autocmd VimEnter * NERDTree " Auto open panel

" Fix syntax highlighting for vue files
autocmd FileType vue syntax sync fromstart

" Vue comments
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

"PLUGIN - vim-ripgrep
let g:rg_highlight = 1

"PLUGIN - CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
