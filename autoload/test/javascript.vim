let test#javascript#patterns = {
  \ 'test': ['\v^\s*%(it|test)\s*[( ]\s*%("|''|`)(.*)%("|''|`)'],
  \ 'namespace': ['\v^\s*%(describe|suite|context)\s*[( ]\s*%("|''|`)(.*)%("|''|`)'],
\}

function! test#javascript#has_package(package) abort
  if filereadable('package.json')
    for line in readfile('package.json')
      if line =~ '"'.a:package.'"'
        return 1
      endif
    endfor
  endif

  if filereadable('.vim-test')
    for line in readfile('.vim-test')
      if line =~ '"'.a:package.'"'
        return 1
      endif
    endfor
  endif

  return 0
endfunction
