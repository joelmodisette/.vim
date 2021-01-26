" Use Vim settings, rather then Vi settings
set nocompatible
set nu
syntax on

colorscheme peachpuff
set guifont=Lucida_Console:h14:cANSI:qDRAFT

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

" My VIM Cheatsheet
" Cool Stuff to add in future
" Improve Insert mode experience maybe?
" 
" inoremap II <Esc>I
" inoremap AA <Esc>A
" inoremap OO <Esc>O
" 
" II jumps before the first non-blank text of the line
" AA jumps to the end of the line
" OO start editing on a new line above the current line
"
" 
" Avoiding the <esc> key
" 
"     :imap jk <Esc>
"              " Can be typed even faster than jj
"     <ctrl> [      ... also works like <esc>
" 
"
" Macros
" 
"     qd	start recording to register d
"     ...	your complex series of commands
"     q	stop recording
"     @d	execute your macro
"     @@ execute your macro again
"     !! you can embed @a to run the macro recursively,
"         ..just include a 'j' line down

"           to edit a register, just "ap then "ayy for register a
"     :g/GET.INVENTORY.ITEM/z#.5   ... show a 5 line context with the :g
" 
"     :g/pattern/norm @o ...execute the macro stored in register 'o' on all lines m
" 
" 
" Folders
" 
"     :help foldmethod
"     :set foldmethod=manual
"     :set foldmethod=indent
"     zf - manuall set this selection as a fold
"     zc - close this fold
"     zo - open this fold
"     zM or zm - close all folds
"     zE - eliminate all folds
"     zR or zr - open all folds
"     :nnoremap <space> za   ...set space bar to toggle open/close a fold
"     :e some_directory/  - to explore a directory
" 
" Mouse use
" 
"     :set mouse=a
"     goes into visual mode
" 
" Refresh
" 
"     :e
" 
" Cursor movement
" 
"     h - move left
"     j - move down
"     k - move up
"     l - move right
"     w - jump by start of words (punctuation considered words)
"     W - jump by words (spaces separate words)
"     e - jump to end of words (punctuation considered words)
"     E - jump to end of words (no punctuation)
"     b - jump backward by words (punctuation considered words)
"     B - jump backward by words (no punctuation)
"     0 - (zero) start of line
"     ^ - first non-blank character of line
"     $ - end of line
"     G - Go To command (prefix with number - 5G goes to line 5)
"     <ctrl> o - go back to last edit location
"     <ctrl> i - go forward to previous edit location
" 
" Note: Prefix a cursor movement command with a number to repeat it. For example, 4
"
"
"
"
" Insert Mode - Inserting/Appending text
" 
"     i - start insert mode at cursor
"     I - insert at the beginning of the line
"     a - append after the cursor
"     A - append at the end of the line
"     o - open (append) blank line below current line (no need to press return)
"     O - open blank line above current line
"     ea - append at end of word
"     Esc - exit insert mode
"     Vjjj> - Indent a block: Press V to switch to VISUAL LINE mode and highlight t
"              will need toset tab size to 3...
" 
"          :set shiftwidth=3  - indenting is 3 spaces
" 
" 
" Editing
" 
"     r - replace a single character (does not use insert mode)
"     J - join line below to the current one
"     cc - change (replace) an entire line
"     cw - change (replace) to the end of word
"     ciw - replace entire word (Awesome!) where your cursor falls
"     daw - delete entire word where your cursor falls
"     c$ - change (replace) to the end of line
"     s - delete character at cursor and subsitute text
"     S - delete line at cursor and substitute text (same as cc)
"     xp - transpose two letters (delete and paste, technically)
"     u - undo last change (can be repeated to undo preceding commands
"     Ctrl-R : Redo changes which were undone (undo the undos).
"     . - repeat last command
" 
" Marking text (visual mode)
" 
"     v - start visual mode, mark lines, then do command (such as y-yank)
"     V - start Linewise visual mode
"     o - move to other end of marked area
"     Ctrl+v - start visual block mode
"     O - move to Other corner of block
"     aw - mark a word
"     ab - a () block (with braces)
"     aB - a {} block (with brackets)
"     ib - inner () block
"     iB - inner {} block
"     Esc - exit visual mode
" 
" Visual commands
" 
"     > - shift right
"     < - shift left
"     y - yank (copy) marked text
"     d - delete marked text
"     ~ (tilde) - switch case
" 
" Cut and Paste
" 
"     yy - yank (copy) a line 
"     "ayy - yank into saved register "a"
"     2yy - yank 2 lines
"     yw - yank word
"     y$ - yank to end of line
"     p - put (paste) the clipboard after cursor
"     P - put (paste) before cursor
"     "ap - put(paste) with register "a"
"     dd - delete (cut) a line
"     dw - delete (cut) the current word
"     x - delete (cut) current character
"     "ayy - yank (copy) a line to buffer: a
"     "ap - put (paste) the clipboard after cursor from buffer: a
" 
" Exiting
" 
"     :w - write (save) the file, but don't exit
"     :wq - write (save) and quit
"     :q - quit (fails if anything has changed)
"     :q! - quit and throw away changes
"     :e - refresh, good for reloading
" 
" Search/Replace
" 
"     * - search for word underneath cursor
"     /pattern - search for pattern
"     ?pattern - search backward for pattern
"     /this\|that - search for this or that
"     /.*this\&.*that - search for this and that, in that order
"     n - repeat search in same direction
"     N - repeat search in opposite direction
"     :%s/old/new/g - replace all old with new throughout file
"     :%s/old/new/gc - replace all old with new throughout file with confirmatin
"     :0:20s/old/new/gc - replace only in lines 0 to 20 with confirmation
"     :20:$s/old/new/gc - replace only in lines 20 to EOF with confirmation
"     /T.*C - search for everythingbetween Cap t and Cap C
"         :%s//together/gc - then use the previous search to replace
" 
" Working with multiple files
" 
"     :e filename - Edit a file in a new buffer
"     :bnext (or :bn) - go to next buffer
"     :bprev (of :bp) - go to previous buffer
"     :bd - delete a buffer (close a file)
"     :bd <tab> - tab through buffer files to find one to delete
"     :sp filename - Open a file in a new buffer and split window
"     :vsp filename - vertical split the current file
"     ctrl+ws - Split windows
"     ctrl+ww - switch between windows
"     ctrl+wq - Quit a window
"     ctrl+wv - Split windows vertically
"     Ctrl-w h
"     Ctrl-w ?	Shift focus to split on left of current
"     Ctrl-w l
"     Ctrl-w ?	Shift focus to split on right of current
"     Ctrl-w j
"     Ctrl-w ?	Shift focus to split below the current
"     Ctrl-w k
"     Ctrl-w ?	Shift focus to split above the current
"     Ctrl-w n+	Increase size of current split by n lines
"     Ctrl-w n–	Decrease size of current split by n lines
"     :tabedit <file> - Open mutiple files in tabs
"     ctrl-pgup/ctrl-pgdn - switch between tabs in Unix
"     :ls - list all files in buffer
"     :vsp | b1 - put buffer 1 in vertical split view
"     :bufdo %s/pattern/replace/gec | update
"         bufdo
" 
"         	Apply the following commands to all buffers.
"         %s	Search and replace all lines in the buffer.
"         pattern	Search pattern.
"         replace	Replacement text.
"         g	Change all occurrences in each line (global).
"         e	No error if the pattern is not found.
"         |	Separator between commands.
"         update	Save (write file only if changes were made).
" 
" 
" 
" Cool things to do
"
"
"     :echo $VIM  ...where is VIM running?
"     :echo $MYVIMRC  ... where is my VIMRC
"     :e $MYVIMRC   ... edit my VIMRC 
"     gvim +/search-term <filename> will go to the first match of the specified sea
"     Gvim +123 <filename> go to the line 12e when opening filename
"     q: - invokes selectable list of ex: command history
"     :his - ...also provides history but no selection
"     :so ~/.vimrc - resource the vimrc or a new one??
"     ctrl+a: increment digit under cursor
"     ctrl+x: decrement digit under cursor
"     All Caps:  visually select then "U" or "u"
"     :exu - index of all EX model commands
"     :g/IF.|ALWAYS/   ... show lines containing IF or ALWAYS
"     :g/IF \& ALWAYS/   ... show lines containing I
"         :redir > file  ...redirect g: results to file
"         :g/for.*bar/#
"         :redir END
"
"     online help
"         :help user-manual
"         :h helphelp  
"     Screen Font Size
"         Bigger: ctrl -
"         Smaller: ctrl shift =  ... or (ctrl +)
"     Avoiding the <esc> key
"         :imap jk <Esc>
"                  " Can be typed even faster than jj
"         <ctrl> [      ... also works like <esc>
" 
" 
"         :vert diffsplit <the file to compare with..> then <C-w> H to get vertical
"         vim archive.tar.gz...will list archived files, which you can edit/save wi
"         :sort /.*\%61v/ n     Sort starting at column 61, numerically
"         :sort n /.*\s/           Sort numbers starting with second column
"         :r <filename>         appends filename to the end of the current file
"         :%s/\s\+$//e  removes all trailing spaces
"         :%d        deletes all lines in a file.
"         For every line containing "foo", substitute all "bar" with "zzz":  :g/foo
"         :sav <filename>  save to a file while continuing your work 
"         :Sex! - Open a directory window in a vertical split
"         gf - Go To file under cursor
"         ctrl-w ctrl-f to do gf but in new window
"         % (on top of a bracket) - FInd matching bracket
" 

"     :%! column -t   This is really a unix command but it aligns or formats columns nicely
"              Used with <CTRL> - v selection, makes modifying columns only easy!!
"
"
"The vi / vim text editor supports running any : command using the following syntax:
"vi +commandHere fileName
"vim +LineNumber fileName
"vi +/searchTermHere fileName
"vi +/LineNumberHere fileName
"vim +/LineNumberHere fileName 
"
"
"




