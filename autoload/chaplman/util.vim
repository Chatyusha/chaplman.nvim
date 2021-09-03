function chaplman#util#data(plugins)
  let l:cache_shell =  expand("<sfile>:p:h") . "/bin/linux/cache.sh"
  let l:cache_list = []
  for i in a:plugins
    let cache_list = add(l:cache_list,system([l:cache_shell,i]))
  endfor
  return json_decode("{" . join(l:cache_list,",")."}")
endfunction

function chaplman#util#mkdirs(origin,data)
  for i in values(data)
    if isdirectory(a:origin . "/" . i) == 0
      echo "now creating ... "
    endif
  endfor
endfunction

function chaplman#util#hoge(parm)
  for i in a:parm
    echo expand(i . ":p")
  endfor
endfunction
