if &compatible || v:version < 702 || (exists('g:loaded_tabcom') && g:loaded_tabcom)
  finish
endif

let g:loaded_tabcom = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

if !exists('g:tabcom_next')
  let g:tabcom_key_next = '<Tab>'
endif

if !exists('g:tabcom_prev')
  let g:tabcom_key_prev = '<S-Tab>'
endif

if !exists('g:tabcom_select_only')
  let g:tabcom_select_only = 1
endif

execute 'inoremap <expr> ' . g:tabcom_key_next . ' tabcom#complete(0)'
execute 'inoremap <expr> ' . g:tabcom_key_prev . ' tabcom#complete(1)'

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
