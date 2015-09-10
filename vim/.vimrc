" .vimrc
" ++++++

" WARNING: This file is a template, and intentionally incomplete.



" Global Settings
" ===============

" NOTE: These settings should be near the top of your vimrc file.

"" Turn on VIM mode. You're not in VI. This should be the first option set.
set nocompatible

"" Turn on filetype detection
filetype on

"" Syntax highlighting, because...
syntax on

"" Turn indentation on
filetype indent on

"" Turn plugins on, because you'll need them for other steps.
filetype plugin on



" DA RULEZ
" ========

" 2 Spaces for indention
" ----------------------

"" Expand tabs to spaces
set expandtab

"" Set the tabstop to 2 for editing alignment
set tabstop=2
set softtabstop=2

"" For tabbing with '<' and '>'
set shiftwidth=2
set shiftround

"" Intelligently handle code tabbing
set smarttab
set smartindent


" Newlines
" --------
"" See commands in README


" No trailing whitespace
" ----------------------
"" Highlight, in flaming red, any trailing whitespace.
highlight TrailingWhitespace ctermbg=red
"" Only apply this when in Normal mode
autocmd InsertLeave * match TrailingWhitespace /\s\+$/
"" Clear the highlighting in Insert mode, because that's annoying
autocmd InsertEnter * match TrailingWhitespace //


" Use Semicolons
" --------------
"" Use the Syntastic plugin.


" 80 characters per line
" ----------------------
"" Angry red background for all characters over 80 characters
match ErrorMsg '\%>80v.\+'

"" set ruler will display the column and row of your cursor
set ruler

"" If a visual indicator is your cup of tea, try colorcolumn
set colorcolumn=80


" Use single quotes
" -----------------
"" Use the Syntastic plugin.


" Opening braces go on the same line
" ----------------------------------
"" Highlight, in flaming red, any hanging braces
highlight HangingOpenBraces ctermbg=red
"" Only apply this when in Normal mode
autocmd InsertLeave * match HangingOpenBraces /^\s*{/
"" Clear the highlighting in Insert mode, because that's annoying
autocmd InsertEnter * match HangingOpenBraces //


" Method chaining
" ---------------


" Declare one variable per var statement
" --------------------------------------


" Use lowerCamelCase for variables, properties and function names
" ---------------------------------------------------------------


" Use UpperCamelCase for class names
" ----------------------------------


" Use UPPERCASE for Constants
" ---------------------------


" Object / Array creation
" -----------------------


" Use the === operator
" --------------------
"" Use the Syntastic plugin.


" Use multi-line ternary operator
" -------------------------------


" Use slashes for comments
" ------------------------


" Object.freeze, Object.preventExtensions, Object.seal, with, eval
" ----------------------------------------------------------------
"" `eval` + `new Function()` - No configuration. Use the Syntastic plugin.


" Getters and setters
" -------------------
