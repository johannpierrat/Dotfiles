" Indent Python in the Google Way
" Taken from google coding style
" www.google-styleguide.googlecode.com/svn/trunk/google_python.style.vim

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

" Maximum number of lines to look backwards
let s:maxoff = 50

function! GetGooglePythonIndent(lnum)
  " Indent inside parens

  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.' < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") -1
      return par_col
    else
      return indent(par_line) + &sw
    endif
  endif

  "" Delegate the rest to the original function
  return GetPythonIndent(a:lnum)
endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"
