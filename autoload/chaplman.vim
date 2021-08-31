scriptencoding utf-8

function chaplman#install(chaplman_root,status)
  let l:repo = a:status["repo"]
  let l:branch = a:status["branch"]
  let l:plugin_path = a:chaplman_root . "/repo/" . a:status["repo"]
  helptags l:plugin_path . "/doc"
endfunction

function chaplman#loadsetting()
  if isdirectory(expand("%s/.vim")) == v:true
  endif
endfunction

function chaplman#loadjson(filepath)
  let l:json_array = execute("call readfile(a:filepath)")
endfunction
