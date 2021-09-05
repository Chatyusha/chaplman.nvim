scriptencoding utf-8

"Where si this plugin?"
let s:chaplpath = expand("<sfile>:p:h:h")

function! chaplman#install(chaplman_root,status) abort
  let l:repo = a:status["repo"]
  let l:branch = a:status["branch"]
  let l:plugin_path = a:chaplman_root . "/repo/" . a:status["repo"]
endfunction

function chaplman#loadsetting()
  let l:envroot = pwd . "/.chaplman"
  if isdirectory(l:envroot) == 0
    call mkdir(l:envroot)
  endif
  if glob(l:envroot . "/settings.json") == ""
    call writefile([],l:envroot . "/settings.json")
  endif
  let l:settingsfile = l:envroot . "/settings.json"
  if chaplman#formatchacker(l:settingsfile) != -1
    call chaplman#loadplugin(l:settingsfile)
  endif
endfunction

function! chaplman#loadjson(filepath) abort
  let l:json_array = readfile(a:filepath)
  let l:json = join(l:json_array,'')
  let l:json_obj = json_decode(l:json)
  "
  "{
  " "plugins":[
  "   {
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
  let l:data = {"repos":[],"sources":[]}
  for i in l:plugins
    let l:repo = g:plugins_dir . "/" . i["repo"]
    let l:source = i["source"]
    let l:data["repos"] = l:data["repos"] + [l:repo]
    let l:data["sources"] = l:data["sources"] + l:source
  endfor
  return l:data
endfunction

function chaplman#loadplugin(envroot, settingfilepath)
  "envroot is FULL-PATH format"
  let l:data = chaplman#loadjson(a:settingfilepath)
  call chaplman#buildenv(a:envroot,l:data["repos"])
  call chaplman#writesettings(a:envroot,l:data["sources"])
  execute("set runtimepath+=".a:envroot)
  runtime "./settings.vim"
endfunction

function chaplman#buildenv(envroot,plugins)
  "ALL ARGS ARE FULL-PATH FORMAT
  let l:envroot = a:envroot
  let l:plgins = a:plugins
  let l:shell_script = s:chaplpath . "/bin/chaplman/localenv.sh"
  echo l:shell_script
  echo s:chaplpath
  call system([l:shell_script, l:envroot] + l:plgins)
  execute("helptags " . l:envroot . "/doc")
endfunction

function! chaplman#writesettings(envroot,sources) abort
  "a:sources is typed array"
  "a:envroot is FULL-PATH

  call writefile(a:sources,a:envroot."/settings.vim")
endfunction

function! chaplman#formatchacker(settingsfilepath) abort
  try
    let l:dict = json_decode(join(readfile(a:settingsfilepath),'')) 
  catch
    echo "json format error"
    return -1
  endtry
  if has_key(l:dict,"plugins") == 1
    if type(l:dict["plugins"]) == v:t_list
      let l:plugins=l:dict["plugins"]
      let l:index = 0
      for i in l:plugins
       if  type(i) == v:t_dict
         if has_key(i,"repo") == 1
           if type(i["repo"]) != v:t_string
             echo "plugins[" . l:index . "]['repo'] is not 'string'"
             return -1
           endif
         else
           echo "plugins[" . l:index . "]key 'repo' is not found"
           return -1
         endif
         if has_key(i,"source") == 1
           if type(i["source"]) != v:t_list
             echo "plugins[" . l:index . "]['source'] is not 'list'"
             return -1
           endif
         else
           echo "plugins[" . l:index . "]key 'source' is not found"
           return -1
         endif
       else
         echo "plugins[" . l:index . "] is not 'dictionary'"
         return -1
       endif
       let l:index = l:index + 1
      endfor
    else
      echo "'plugins' is not list"
      return -1
    endif
  else
    echo "key 'plugins' not found"
    return -1
  endif
  return 1
endfunction
