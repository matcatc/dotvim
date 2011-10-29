" Do this first (or before filetype on stuff)
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Do this to load pathogen correctly
"filetype off
"filetype plugin indent on

set nocompatible


set showcmd         " shows number of lines highlighted in visual mode (+ other stuff prob)

" auto indenting
"  we do not use smartindent or autoindent (with python) because it causes the
"  comments to immediately go to the beginning of the line, which is REALLY
"  annoying
"set smartindent
"set autoindent

" python PEP8 standards
set expandtab
"set textwidth=79           " ignoring b/c its REALLY annoying
set tabstop=4		    " TODO: Should this be 4?
set softtabstop=4
set shiftwidth=4

:syntax on

" for omnicomplete
filetype plugin on
set ofu=syntaxcomplete#Complete

" ctags tags file
"  Is this really where we want it? What about in projects that have multiple
"  levels? Or perhaps this is a default and we can set the file manually
"  otherwise
set tags=tags
set tags+=$HOME/.vim/tags/python.ctags

" for MiniBufExplorer
"  Uninstalled, keep until we're sure we don't want it anymore
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"
"let g:miniBufExplForceSyntaxEnable = 1      " force syntax highlighting (for bug)



" for tasklist
" <Leader>t ('\t') is already set
let g:tlTokenList = ['TODO', 'FIXME', 'XXX', 'NEXT', 'EVENTUALLY']

" for dictionary completion
set dictionary+=/usr/share/dict/words


" for spelling
"  to actually use spelling during vim session, need to:
"  set spell
set spelllang=en_us


" colorscheme
" There are a bunch of possible good options, I just choose one
if has("gui_running")
    colorscheme twilight
else
    " TODO: terminal color issues
    set background=dark
    colorscheme default
endif

"" menu and toolbars
"
" tabline
" so that we don't have resizing issues with the tabline appearing in the gui
"  causing the command line to disappear
if has("gui_running")
    set guioptions-=m       " hide menubar
    set guioptions-=T       " hide toolbar
    set showtabline=2
endif

