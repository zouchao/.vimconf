nnoremap <silent><F2> :Defx <cr>
call defx#custom#option('_', {
      \'columns': 'indent:git:icons:filename',
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })
" 这是我的配置. 参考文档种的配置做的修改.  还需完善
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> <CR>
			  \ <SID>defx_toggle_tree()
  nmap <silent><buffer><expr> o
			  \ defx#is_directory() ?
			  \ defx#do_action('open_or_close_tree') :
			  \ defx#do_action('drop',)
  nnoremap <silent><buffer><expr> s
			  \ defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v
			  \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t
			  \ defx#do_action('drop', 'tabe')
  nnoremap <silent><buffer><expr> O
			  \ defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> C
			  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> P
			  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> M
			  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> D
			  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> A
			  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> U
			  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> .
			  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space>
			  \ defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> R
			  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> X
			  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> x
			  \ defx#do_action('close_tree')
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction

let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 0
hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 1
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_copy_icon = ''
let g:defx_icons_move_icon = ''
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''
