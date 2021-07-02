function match = str_has_option(input_option, option_scope)
  match = 0;
  for ii = 1:length(input_option)
    for jj = 1:length(option_scope)
      if input_option(ii) == option_scope(jj)
        match = jj;
        return
      endif
    endfor
  endfor
endfunction
