" Test-running stuff for zeus
" map <leader>S :call RunCurrentTest() <CR>
" map <leader>s :call RunCurrentLineInTest() <CR>

function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()
    call SelectTestRunner()
  endif

  exec g:last_test_runner g:last_test_file
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
    call SelectTestRunner()
  end

  exec g:last_test_runner g:last_test_file . ":" . g:last_test_file_line
endfunction

function! SelectTestRunner()
  call SetZeus()
  if match(expand('%'), '\.feature$') != -1
    call SetTestRunner("!clear;" . g:zeus . "cucumber")
  elseif match(expand('%'), '_spec\.rb$') != -1
    if has('gui_running')
      call SetTestRunner("!clear;" . g:zeus . "rspec --no-color")
    else
      call SetTestRunner("!clear;" . g:zeus . "rspec")
    endif
  else
    call SetTestRunner("!clear;ruby -Itest")
  endif
endfunction

function! SetZeus()
  if findfile(".zeus.sock", ".;") == ".zeus.sock"
    let g:zeus="zeus "
  else
    let g:zeus=""
  endif
endfunction

function! SetTestRunner(runner)
  let g:last_test_runner=a:runner
endfunction

function! SetTestFile()
  let g:last_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:last_test_file=@%
  let g:last_test_file_line=line(".")
endfunction

