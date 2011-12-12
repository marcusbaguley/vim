function! SaveSession()
  " the root directory is the session name
  let session_name = strpart(getcwd(), match(getcwd(), "[^/.]*$"))
  wall
  execute "mksession! ~/.vim/sessions/" . session_name
  echomsg "\"" . session_name . "\" session written"
endfunction
