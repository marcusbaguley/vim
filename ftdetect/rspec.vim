autocmd BufNewFile,BufRead *_spec.rb call SetCompilerForRspec()

function SetCompilerForRspec()
  compiler rspec
  if !empty(glob('.zeus.sock'))
    set makeprg=clear;\ zeus\ rspec
  elseif !empty(glob('Gemfile'))
    set makeprg=clear;\ bundle\ exec\ rspec
  else
    set makeprg=clear;\ rspec
  endif
endfunction

