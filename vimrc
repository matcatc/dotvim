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
" <Leader>t ('\t') is already set
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
if has("gui_running")
    colorscheme twilight
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



