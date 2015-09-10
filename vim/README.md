Vim
===

> Vim is my favorite text editor. I've been using it for years... I can't figure out how to exit.

JSHint is awesome, but wouldn't it be better if your code automagically formatted itself?

Of course you do. Swan dive into these configuration settings!

## .vimrc

I've grouped several settings in buckets based on the new style rules. This will allow you to pick and chose which settings you would like to use.

*NOTE*: This is a template file, not a complete `.vimrc`. It should be used as a reference.

If you have specific settings for different file types, or you don't want to pollute your settings, you can prefix these commands with the `autocmd` command.

    " Tabstop = 2 when editing Javascript
    autocmd FileType javascript set tabstop=2

Note, there are several rules that won't have any VIM formatting bindings.

## Commands

Some rules can be enforced with commands or functions.

#### Newlines

Tired of those annoying `^M` characters around? See some in your code and want to purge them in holy fire?

First save your work...

    :w
    :e ++ff=dos
    :w ++ff=unix

#### Trailing whitespace

Search the current file and remove all trailing whitespace.

    :%s/\s\+$

## Plugins

#### [Syntastic][syn]

Syntastic shows you the JSHint data in VIM. Incredibly useful when reading and editing files. Note that you have to save the file before the hinting begins.

You will also need JSHint. `npm install -g jshint`

Used for:

* Single quotes
* Semicolons
* eval, `new Function` and with
* The `===` operator

[syn]: https://github.com/scrooloose/syntastic

#### vim-javascript, vim-javascript-syntax

Better highlighting and indentation than stock. Both are useful for automating formatting.

[vjs]: https://github.com/pangloss/vim-javascript
[vjss]: https://github.com/jelera/vim-javascript-syntax
