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
  let l:json_array = readfile(a:filepath)
  let l:json = join(l:json_array,'')
  let l:json_obj = json_decode(l:json)
  "
  "{
  " "plugins":[
  "   "plugin":{
  "     "repo":"Chatyusha/Chaplman.vim",
  "     "source":[
  "       "VIM SCRIPTS",
  "       "VIM SCRIPTS"
  "     ]
  "   }
  " ]
  "}
  "
  let l:plugins = l:json_obj["plugins"]
endfunction

function chaplman#loadplugin(params)
 let l:repo = a:params["repo"]
 let l:scr = a:params["source"]
endfunction

