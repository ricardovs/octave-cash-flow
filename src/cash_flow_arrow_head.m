function arrow = cash_flow_arrow_head(x, y, dx,dy)
  arrow = [0. 0.];
  arrow(1) = line([x-dx x], [y-dy y]);
  arrow(2) = line([x x+dx], [y y-dy]);
endfunction
