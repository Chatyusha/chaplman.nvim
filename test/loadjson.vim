let s:array = readfile(expand("<sfile>:h:p")."/test.json")
let s:json = join(s:array,'')
let s:json_obj = json_decode(s:json)
echo s:json_obj["meta1"]
