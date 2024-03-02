model war
  Real x(start=200000);
  Real y(start=119000);
equation
  der(x) = -0.5*x - 0.8*y + sin(time +5) + 1;
  der(y) = -0.7*x  - 0.5*y + cos(time + 5) + 1;
  
  if x<=0 then
    terminate("X was defeated");
  end if;
  if y<=0 then
    terminate("Y was defeated");
  end if;
end war;
