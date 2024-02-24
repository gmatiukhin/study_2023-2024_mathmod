model war_guerrilla
  Real x(start=200000);
  Real y(start=119000);
equation
  der(x) = -0.5*x - 0.8*y + sin(10*time);
  der(y) = -0.3*x*y - 0.5*y + cos(10*time);
  
  if x<=0 then
    terminate("X was defeated");
  end if;
  if y<=0 then
    terminate("Y was defeated");
  end if;
end war_guerrilla;