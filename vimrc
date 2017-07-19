" Use Vim settings, rather then Vi settings
set nocompatible
set nu
syntax on

vnoremap // y/<C-R>"<CR>

" To save, ctrl-s.
nmap <Ctrl-s> :w<CR>
imap <Ctrl-s><Esc>:w<CR>a

" Make jk into the escape function
inoremap jk &lt;Esc&gt;

" Make <ctrl> j into a line break
nnoremap <NL> i<CR><ESC>

" ignore wrapped lines with jk
nnoremap j gj
nnoremap k gk


set ruler

" display incomplete commands.
set showcmd

" Search as you type.
set incsearch

" Ignore case when searching.
set ignorecase

" Show editing mode
set showmode

" Show title
set title

" set folding method to manual
:set foldmethod=manual

" Avoiding the <Esc> key with just 'jk'
:imap jk <Esc>

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\         " buffer number
set statusline+=%f\              " filename
set statusline+=%h%m%r%w         " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
set statusline+=%=                           " right align remainder
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P               " file position

set textwidth=80

" 80 margin line
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

autocmd BufNewFile,BufRead *.sim source /home/modisette/.vim/ftplugin/simscript.vim

" simscript formatting

:syntax match Comment /''.*/
:syntax match Conditional /IF/
:syntax match Conditional /ELSE/
:syntax match Conditional /OTHERWISE/
:syntax match Conditional /ALWAYS/
:syntax match Constant / \..*/
:syntax match Error /	/
:syntax match Function /ROUTINE .*/
:syntax match Function /CALL .*/
:syntax match Number /-\=\<\d\+\>/ 
:syntax match Float /-\=\<\d\+\(\.\d\+\)\=\(&&\=[+-]\=\d\+\)\=\>/ 
:syntax match Float /-\=\.\d\+\(&&\=[+-]\=\d\+\)\=\>/ 




