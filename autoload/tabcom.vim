let s:save_cpoptions = &cpoptions
set cpoptions&vim

function! tabcom#complete(dir)
  let selections = g:tabcom_select_only ? ["\<Down>", "\<Up>"] : ["\<C-n>", "\<C-p>"]

  if pumvisible()
    return selections[a:dir]
  endif

  let pos = getpos('.')
  let ctx = strpart(getline(pos[1]), 0, pos[2] - 1)
  echomsg ctx
  let indentations = ["\<Tab>", "\<C-d>"]

  if match(ctx, '^[\t ]*$') == 0
    return indentations[a:dir]
  endif

  let sep = (has('win32') && !&shellslash) ? '\\' : '/'

  if match(ctx, sep . '$') >= 0
    return "\<C-x>\<C-f>"
  endif

  if &omnifunc != ''
    return "\<C-x>\<C-o>"
  endif

  if &filetype == 'vim'
    return "\<C-x>\<C-v>"
  endif

  return "\<C-n>"
endfunction

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
