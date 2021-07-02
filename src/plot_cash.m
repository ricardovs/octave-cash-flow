function  plot_cash (x, Y, op, arrow_dx=0, arrow_dy=0)
  assert(isvector(x), 'x must be vector');
  newplot();
  hold on;
  
  #Set scale of arrow
  plot_arrow = 0;
  if length(findstr('a', op))>0
    plot_arrow = 1;
    if arrow_dx<=0
      arrow_dx = .4;
    endif
    if arrow_dy<=0
      arrow_dy = scale*min(vec(abs(Y(abs(Y)>0))));
    endif
  endif
  
  invert_arrow = 0;
  if length(findstr('i', op))>0
    invert_arrow = 1;
  endif
  
  #Set color plot
  pcolor='b';
  pcolor_options = 'krgbymcw';
  pcolor_chosen = str_has_option(op, pcolor_options);
  if pcolor_chosen>0
    pcolor=pcolor_options(pcolor_chosen);
  endif
  
  if any(any(Y!=0))
    for i=1:length(x)
      y = Y(i,:);
      y=y(y>0);
      py=0;
      if length(y) > 0 
        for j=1:length(y)
          line([x(i) x(i)], [py py+y(j)], 'color', pcolor );
          py+=y(j);
          if plot_arrow > 0
            if invert_arrow>0
              arrow_head = cash_flow_arrow_head(x(i), py-y(j), arrow_dx, -1*arrow_dy);
            else 
              arrow_head = cash_flow_arrow_head(x(i), py, arrow_dx, arrow_dy);
            endif
            set(arrow_head, 'color', pcolor);
          endif
        endfor
      endif
      y = Y(i,:);
      y=y(y<0);
      py=0;
      if length(y) > 0 
        for j=1:length(y)
          line([x(i) x(i)], [py py+y(j)], 'color', pcolor );
          py+=y(j);
          if plot_arrow > 0
            if invert_arrow>0
              arrow_head = cash_flow_arrow_head(x(i), py-y(j), arrow_dx, arrow_dy);
            else
              arrow_head = cash_flow_arrow_head(x(i), py, arrow_dx, -1*arrow_dy);
            endif
            set(arrow_head, 'color', pcolor);
          endif
        endfor
      endif
    endfor
  endif
  hold off;
  axis tight;
  grid on;
endfunction
