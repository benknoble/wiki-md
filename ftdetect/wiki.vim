let g:wiki_root = get(g:, 'wiki_root', expand('~/.wiki'))

execute printf('autocmd BufRead,BufNewFile %s/* execute "setlocal filetype=wiki.".&filetype', g:wiki_root)
