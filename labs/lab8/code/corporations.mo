model corporations
  Real M1(start=4.7), M2(start=4.2);
  parameter Real p_cr = 11.1, N = 32, q = 1, tau_1 = 17, tau_2 = 27, p_1 = 7.7, p_2 = 5.5;
  parameter Real a_1 = p_cr / (tau_1^2 * p_1^2 * N * q);
  parameter Real a_2 = p_cr / (tau_2^2 * p_2^2 * N * q);
  parameter Real b = p_cr / (tau_1^2 * p_1^2 * tau_2^2 * p_2^2 * N * q);
  parameter Real c_1 = (p_cr - p_1) / (tau_1 * p_1);
  parameter Real c_2 = (p_cr - p_2) / (tau_2 * p_2);
  parameter Real bias = 0.0;
equation
  der(M1) = M1 - (b/c_1 + bias) * M1 * M2 - (a_1/c_1) * M1^2;
  der(M2) = (c_2/c_1) * M2 - (b/c_1) * M1 * M2 - (a_2/c_1) * M2^2;
end corporations;
