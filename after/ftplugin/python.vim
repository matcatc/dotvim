" python PEP8 standards
set expandtab
"set textwidth=79           " ignoring b/c its REALLY annoying
set tabstop=4		    " TODO: Should this be 4?
set softtabstop=4
set shiftwidth=4




" auto indenting
"  we do not use smartindent or autoindent (with python) because it causes the
"  comments to immediately go to the beginning of the line, which is REALLY
"  annoying
" TODO look into getting auto indentation to work
set autoindent


" for pylint
"autocmd FileType python compiler pylint


" folding (for python)
set foldmethod=indent


