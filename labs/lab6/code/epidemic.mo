model epidemic
  parameter Real N(start=19500);
  parameter Real I0 = 88;
  parameter Real R0 = 25;
  parameter Real S0 = N - I0 - R0;
  Real I(start=I0); Real R(start=R0); Real S(start=S0);
  parameter Real a = 0.1; parameter Real b = 0.2;
equation
  der(S) = - a * S;
  der(I) = a * S - b * I;
  der(R) = b * I;
end epidemic;
