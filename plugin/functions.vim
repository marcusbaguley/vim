function SetCompilerForRspec()
  compiler rspec
  if !empty(glob('.zeus.sock'))
    set makeprg=zeus\ rspec
    " nmap <leader>s :Start zeus rspec %\:=line('.')<CR><CR>
  elseif !empty(glob('Gemfile'))
    set makeprg=bundle\ exec\ rspec
    " nmap <leader>s :Start bundle exec rspec %\:=line('.')<CR><CR>
  else
    set makeprg=rspec
    " nmap <leader>s :Start rspec %\:=line('.')<CR><CR>
  endif
endfunction
