autocmd BufNewFile,BufRead *_spec.rb call SetCompilerForRspec()

function SetCompilerForRspec()
  compiler rspec
  if !empty(glob('.zeus.sock'))
    set makeprg=zeus\ rspec
  elseif !empty(glob('Gemfile'))
    set makeprg=bundle\ exec\ rspec
  else
    set makeprg=rspec
  endif
endfunction

