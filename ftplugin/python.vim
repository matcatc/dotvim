" auto indenting
"  we do not use smartindent or autoindent (with python) because it causes the
"  comments to immediately go to the beginning of the line, which is REALLY
"  annoying
set nosmartindent
set noautoindent


" for pylint
"autocmd FileType python compiler pylint


" folding (for python)
set foldmethod=indent

