function! chaplman#git#addplugin(repo) abort
  let l:download_dir = expand(g:plugins_dir) . "/" . a:repo
  if isdirectory(fnamemodify(l:download_dir,":p:h"))
    call mkdir(fnamemodify(l:download_dir,":p:h"))
  endif
  let l:cmd = [
        \"git",
        \"clone",
        \"https://github.com/".a:repo.".git",
        \l:download_dir
        \]
  call system(l:cmd)
endfunction
