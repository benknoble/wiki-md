function wiki#edit_root() abort
  execute 'edit' g:wiki_root
endfunction

function wiki#make_link(file) abort
  let l:found = findfile(a:file)
  if empty(l:found)
    call writefile([], g:wiki_root.'/'.a:file)
  endif
endfunction

function wiki#goto(file, how) abort
  call wiki#make_link(a:file)
  let l:cmd = get(
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

function wiki#index(root, prefix, ...) abort
  let l:dir = isdirectory(a:root) ? a:root : fnamemodify(a:root, ':h')
  return globpath(a:root, '**', 1, 1)
        \ ->map(printf('substitute(v:val, "^%s/", "", "")', g:wiki_root))
        \ ->filter('count(a:000, v:val) == 0')
        \ ->map(printf('substitute(v:val, "^", "%s", "")', escape(a:prefix, '"')))
        \ ->sort()
        \ ->join("\n")
endfunction
