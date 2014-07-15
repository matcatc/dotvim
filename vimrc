" Do this first (or before filetype on stuff)
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()



" Do this to load pathogen correctly
"  TODO haven't used this in ages, remove?
"filetype off
"filetype plugin indent on




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
vnoremap <S-C-l> l
vnoremap <S-C-4> g$
vnoremap <S-C-6> g^
vnoremap <S-C-0> g0
nnoremap <S-C-j> gj
nnoremap <S-C-k> gk
nnoremap <S-C-h> h
nnoremap <S-C-l> l
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
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       omnicomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
set ofu=syntaxcomplete#Complete

" Third party jedi autocompleteion mechanism
"let g:jedi#autocompletion_command = "<S-Space>"     " alternate keymap (Ctrl-x Ctrl-o still seems to work though)
let g:jedi#show_function_definition = "0"             " no popup window. Goes away on its own, but I usually don't want it anyways. Option doesn't seem to have any effect.
let g:jedi#popup_on_dot = 0                         " no popup on dot


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Is this really where we want it? What about in projects that have multiple
"  levels? Or perhaps this is a default and we can set the file manually
"  otherwise
set tags=tags
set tags+=$HOME/.vim/tags/python.ctags



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       tasklist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Leader>t ('\t') is already set by the plugin, but the Command-T plugin will
"   also try to map it, so we do it here.
noremap <unique> <Leader>t <Plug>TaskList
let g:tlTokenList = ['TODO', 'FIXME', 'XXX', 'NEXT', 'EVENTUALLY']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Command-T
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I'm keeping <Leader>t for tasklist, since I've been using it like that for a
" while now (so muscle-memory might interfere if I used it for Command-T.)
nnoremap <silent> <Leader>s :CommandT<CR>


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
if has("gui_running")
    colorscheme twilight-custom
else
    " terminal limited to 256 colors, which thereby severely limits the
    " colorschemes
    colorscheme default
    set background=dark
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




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Prevent F1 from opening help
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Since it's too easy to hit F1 by accident when trying to hit Esc.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>



" TODO: test these out:
"nnoremap j gj
"nnoremap k gk


" TODO: test these out:
"nnoremap <leader>v V`]


" TODO: test these out (highlighted search, and clearing the last highlighted search):
"set hlsearch
"nnoremap <silent> ,/ :nohlsearch<CR>
"
"
"
"TODO: test this out
" Save a file using sudo if alread opened
"cnoremap w!! w !sudo tee % >/dev/null


"
