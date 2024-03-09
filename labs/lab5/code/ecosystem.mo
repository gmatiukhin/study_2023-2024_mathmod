model ecosystem
  Real x(start = 4);
  Real y(start = 9);
  parameter Real a = 0.77;
  parameter Real b = 0.33;
  parameter Real c = 0.077;
  parameter Real d = 0.033;
equation
  der(x) = - a * x + c * x * y;
  der(y) = b * y - d * x * y;
end ecosystem;