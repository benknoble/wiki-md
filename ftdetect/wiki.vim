let g:wiki_root = get(g:, 'wiki_root', expand('~/.wiki'))

execute printf(
      \ 'autocmd BufRead,BufNewFile %s/* execute "setlocal filetype=wiki.".%s',
      \ g:wiki_root,
      \ "substitute(&filetype, '\\C\\<wiki\\>\\.', '', 'g')")
