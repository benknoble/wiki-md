function wiki#edit_root(how) abort
  execute a:how g:wiki_root
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

function wiki#search(pattern) abort
  execute 'vimgrep' a:pattern g:wiki_root.'/**'
endfunction

function s:make_index(glob, root, prefix, exclude) abort
  let l:dir = isdirectory(a:root) ? a:root : fnamemodify(a:root, ':h')
  return globpath(l:dir, a:glob, 1, 1)
        \ ->map(printf('substitute(v:val, "^%s/", "", "")', g:wiki_root))
        \ ->filter('count(a:exclude, v:val) == 0')
        \ ->map(printf('substitute(v:val, "^", "%s", "")', escape(a:prefix, '"')))
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
  const wikis = globpath(g:wiki_root, '**', v:false, v:true)
  const wikis_no_root = wikis->map({ _, w -> substitute(w, '^'.g:wiki_root.'/', '', '') })
  const matching = wikis_no_root->filter({ _, w -> w =~# a:ArgLead })
  return matching
endfunction
