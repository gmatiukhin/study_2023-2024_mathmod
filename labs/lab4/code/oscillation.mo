model oscillation
  Real x(start = 1);
  Real dx(start = 0);
  parameter Real g = 0;
  parameter Real w2 = 6;
equation
  der(x) = dx;
  der(dx)= - g * dx - w2 * x - cos(3.5 * time);
end oscillation;