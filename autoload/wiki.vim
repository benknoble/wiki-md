function wiki#edit_root(how) abort
  execute a:how g:wiki_root
endfunction

function wiki#wikis(glob) abort
  return globpath(g:wiki_root, a:glob, v:false, v:true)
endfunction

function wiki#search(pattern) abort
  echohl WarningMsg
  echomsg "Deprecated: see ``:help wiki#search''"
  echohl None

  if empty(a:pattern) || a:pattern =~# '^\s\+$'
    return
  end
  execute 'vimgrep' a:pattern g:wiki_root.'/**'
endfunction

function wiki#make_link(file) abort
  const l:found = findfile(a:file)
  if empty(l:found)
    call writefile([], g:wiki_root.'/'.a:file)
  endif
endfunction

function wiki#goto(file, how) abort
  call wiki#make_link(a:file)
  const l:cmd = get(
        \ {
        \   'edit': 'find',
        \   'split': 'sfind',
        \   'vert': 'vertical sfind',
        \   'tab': 'tab sfind',
        \ },
        \ a:how,
        \ 'find')
  execute l:cmd a:file
endfunction

function s:strip_root(string) abort
  return substitute(a:string, printf('^%s/', g:wiki_root), '', '')
endfunction

function s:make_index(glob, root, prefix, exclude) abort
  const l:dir = isdirectory(a:root) ? a:root : fnamemodify(a:root, ':h')
  return globpath(l:dir, a:glob, 1, 1)
        \ ->map({ _, w -> s:strip_root(w) })
        \ ->filter({ _, w -> count(a:exclude, w) == 0 })
        \ ->map({ _, w -> substitute(w, '^', escape(a:prefix, '"'), '') })
        \ ->sort()
        \ ->join("\n")
endfunction

function wiki#tree_index(root, prefix, exclude) abort
  return s:make_index('**', a:root, a:prefix, a:exclude)
endfunction

function wiki#flat_index(root, prefix, exclude) abort
  return s:make_index('*', a:root, a:prefix, a:exclude)
endfunction

function wiki#complete_wikis(ArgLead, CmdLine, CursorPos) abort
  return wiki#wikis('**')
        \ ->map({ _, w -> s:strip_root(w) })
        \ ->filter({ _, w -> w =~# a:ArgLead })
endfunction
