model promotion
  Real n(start=12);
  parameter Real N = 648;
equation
  der(n) = (sin(10 * time) + 0.9 * time * n) * (N - n);
end promotion;
