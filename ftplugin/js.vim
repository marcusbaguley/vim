set makeprg=jshint\ %
au BufWritePost * :silent make | redraw!

au QuickFixCmdPost [^l]* nested cwindow
au QuickFixCmdPost    l* nested lwindow
