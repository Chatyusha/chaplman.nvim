if exists('g:loaded_chaplman')
  finish
endif
let g:loaded_chaplman = 1

"1 : if './.chaplman/' does not exist, it is created automatically. "
let g:autocreate_chaplmanenv = get(g:,'autocreate_chaplmanenv',0)

"1 : if './.chaplman/' exists, load plugins set './.chaplman/settings.json'
"automatically"
let g:autoload_chaplmanenv = get(g:,'autoload_chaplmanenv',1)


"if exists('g:plugins_dir') != 1
"  echo "ERROR!"
"  echo "'g:plugins_dir' is not defined"
"else
"  if g:autocreate_chaplmanenv == 1
"    call chaplman#default()
"  endif
"  if g:autoload_chaplmanenv == 1
"    call chaplman#loadsetting()
"  endif
"endif

augroup chaplmanload
  autocmd!
  autocmd VimEnter * call chaplman#check()
augroup END

command! ChaplLoad call chaplman#loadsetting()
