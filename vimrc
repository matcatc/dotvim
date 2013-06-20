" Do this first (or before filetype on stuff)
execute pathogen#infect()


" Do this AFTER loading pathogen
filetype plugin indent on




set nocompatible


set showcmd         " shows number of lines highlighted in visual mode (+ other stuff prob)

set tabpagemax=50   " max # pages opened w/ `vim -p`

:syntax on




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Line number stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set number             " Show line numbers
"set relativenumber     " Show line numbers as relative to current position.
                        "  Useful for more complicated vim commands (e.g.:
                        "  delete several lines).



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Showing invisible characters
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the list characters for `set list` to show whitespace
"  I normally don't need the eol characters, since I use the trailing spaces
"  to identify that there's extra "trailing" spaces at the end of a line.
"set listchars=tab:▶\ ,trail:◦,eol:¬
set listchars=tab:▶\ ,trail:◦
" Toggling command for list
nnoremap <leader>l :set list!<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Line wrapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Soft linewrapping
set linebreak       " Don't wrap lines in the middle of a word. Doesn't work
                    "  with :set list enabled.
set showbreak=…     " Start continued lines with this character, to make it
                    "  clear it's a continuation of the previous line.
" The g<movement keys> work well with soft-wrapped text, to move around in
"  visual lines. These bindings make it easier to work with, although it'd be
"  nicer if we could do Super key (e.g.: windows key) - movement. You can hold
"  down Shift-Ctrl and then move around visually.
vnoremap <S-C-j> gj
vnoremap <S-C-k> gk
vnoremap <S-C-h> h
"vnoremap <S-C-l> l
vnoremap <S-C-4> g$
vnoremap <S-C-6> g^
vnoremap <S-C-0> g0
nnoremap <S-C-j> gj
nnoremap <S-C-k> gk
nnoremap <S-C-h> h
"nnoremap <S-C-l> l
nnoremap <S-C-4> g$
nnoremap <S-C-6> g^
nnoremap <S-C-0> g0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hard linewrapping
"  Use gwap, gwip, gqap, gqip
" Optionally, update formatoptions to affect the formatting algorithm and
" autoformatting.



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Tabs and indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default settings. Should probably be overridden for some languages, projects
set tabstop=4
set softtabstop=4
set shiftwidth=4

"Tabs are preferred at work, so don't expand to spaces
set noet


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       omnicomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on

" Not sure why we had this set before. Try without for now.
"set omnifunc=syntaxcomplete#Complete

" Third party jedi autocompletion mechanism
"let g:jedi#autocompletion_command = "<S-Space>"     " alternate keymap (Ctrl-x Ctrl-o still seems to work though)
let g:jedi#popup_on_dot = 0                         " no popup on dot


" Third party OmniCppComplete autocompletion mechanism
" Based on http://vim.wikia.com/wiki/C%2B%2B_code_completion
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 0 " autocomplete after .
let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" See :help tags for more Info.
" :tag <tag> to jump to <tag>
" :tag /<tag> to search for <tag>
" Ctrl-] to jump to the definition of the selected tag
" Ctrl-T to jump back
" Ctrl-W Ctrl-] to open the definition of the selected tag in a new horizontal
" buffer
"
set tags=./tags;$HOME            " Search current directory up to $HOME for the tags file (recurse up). From: http://stackoverflow.com/a/741486
set tags+=$HOME/.vim/tags/python.ctags      " Not sure why this is here...

" Build tags from vim with Ctrl-F12
" TODO: found several places online. Try it out sometime and modify as
"  necessary.
map <C-F12> :!ctags -R --exclude=.svn --exclude=.git --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


" TODO: figure out a way to do tags for projects?



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       tasklist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tlTokenList = ['TODO', 'FIXME', 'XXX', 'NEXT', 'EVENTUALLY']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Dictionary / spelling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for dictionary completion
set dictionary+=/usr/share/dict/words


" for spelling
"  to actually use spelling during vim session, need to:
"  set spell
set spelllang=en_us




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" There are a bunch of possible good options, I just choose one
" TODO: finalize on the colorscheme we want to use. Perhaps tweak the
" colorscheme as well.
if has("gui_running")
    set background=dark " Some colorschemes will set this, so we set it before
                        " calling them so they can override this option if
                        " they so choose.
"    colorscheme twilight-custom
    colorscheme wombat
else
    " terminal limited to 256 colors, which thereby severely limits the
    " colorschemes
    colorscheme default
    set background=light
endif




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       menu and toolbars
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" tabline
" so that we don't have resizing issues with the tabline appearing in the gui
"  causing the command line to disappear
if has("gui_running")
    set guioptions-=m       " hide menubar
    set guioptions-=T       " hide toolbar
    set showtabline=2
endif




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Syntastic configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: Put this in language specific files?
let g:syntastic_python_checker_args = ''
let g:syntastic_python_checker_args .= ' --max-line-length 120'       " I usually have 120+ character wide windows, so I can afford to have longer lines.
let g:syntastic_python_checker_args .= ' --bad-functions=apply,input' " I don't think map and filter are bad




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       haskellmode configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Must be done before the haskellmode files are read, so can't go in
" after/haskell.vim
let g:haddock_browser="firefox"
au Bufenter *.hs compiler ghc

" ghc.vim by default sets cmdheight=3. I don't like it wasting that much space, so I
" went inside and commented that line out. If we want it to be different, we
" can put it in after/ftplugin/haskell.vim




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       custom macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Macro for appending 'TODO: delete when done debugging' to the end of the
" line
"
" Got idea for implementation regarding the comment characters from:
" http://stackoverflow.com/a/3873207/191008
" 
" Set comment characters for common languages
let b:EndComment=""
autocmd FileType python,sh,bash,zsh,ruby,perl,muttrc,conf let b:StartComment="#" | let b:EndComment=""
autocmd FileType html let b:StartComment="<!--" | let b:EndComment="-->"
autocmd FileType php,cpp,javascript let b:StartComment="//" | let b:EndComment=""
autocmd FileType c,css let b:StartComment="/*" | let b:EndComment="*/"
autocmd FileType vim let b:StartComment="\"" | let b:EndComment=""
autocmd FileType ini let b:StartComment=";" | let b:EndComment=""
autocmd FileType sql let b:StartComment="--" | let b:EndComment=""

function! DWDD()
    if !exists("b:StartComment")
        echo "ERROR: b:StartComment not defined for the current buffer"
    else
        execute ":normal A".b:StartComment." TODO: Delete When Done Debugging".b:EndComment
    endif
endfunction

:map <leader>dwdd :call DWDD()<CR>



" Go to a specific line number, but specify the line number in hex (0x0123)
"  Will _probably_ accept other number formats as well
"
" Called HexG for Hexadecimal number "G" (as in the normal mode command) for
" "Go"
function! HexG(hexLine)
    let decLine = printf("%d", a:hexLine)
    " Equivalent of :12345
    execute decLine
endfunction
command -nargs=1 HexG call HexG(<q-args>)



" Sums the currently visually selected numbers
" @warning: Will overwrite the default register (better than overwriting a named
"  one and is easier to paste back...).
function! SumSelection(sel)
    " Use printf to ensure there's no newline characters, which make pasting
    " the sum back into the buffer harder
    let sum = system("awk '{total+=$1}END{printf \"%d\", total}'", a:sel)

    echo sum

    " set the default register in character mode to make it easy to paste back
    " into the document
    call setreg('"', sum, 'c')
endfunction
" su for sum
:vmap <leader>su y:call SumSelection(@")<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Prevent F1 from opening help
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Since it's too easy to hit F1 by accident when trying to hit Esc.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Miscellaneous mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" TODO: test these out:
"nnoremap j gj
"nnoremap k gk


" TODO: test these out:
"nnoremap <leader>v V`]


" TODO: test these out (highlighted search, and clearing the last highlighted search):
"set hlsearch
"nnoremap <silent> ,/ :nohlsearch<CR>



" Save a file using sudo if alread opened
cnoremap w!! w !sudo tee % >/dev/null


" Cd to the directory the current file resides in
" Also prints out the directory afterwards, so we know what the new directory
"  is.
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install Ack: (ack-grep in Debian systems) or http://beyondgrep.com/install/



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Ctrl-P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To make Ctrl-P vim plugin just use Vim's working directory (pwd). Otherwise
" it will always start searching from the current file's directory. I use this
" as I typically will open vim in a project's root directory then open files
" from there.
let g:ctrlp_working_path_mode = '0'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Syntax related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HiLinkTrace: See :help hilinks
"
" hexHighlight: See bundle/hexHighlight/README for details. In summary:
"   <Leader>F2 to highlight things of the form #00FF00.
"   Warning: #0F0 doesn't work, regardless of what the README says.
"
" hitest.vim: see :help hitest.vim. Useful for debugging/testing colorschemes.
" In summary:
"   :source $VIMRUNTIME/syntax/hitest.vim
"



