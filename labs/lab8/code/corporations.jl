path = pwd()
try
  _path = ARGS[1]
  if !isdir(_path)
    println("Image output directory is not a directory. Using cwd.")
  else
    global path = _path
  end
catch e
  println("No output directory for images passed. Using cwd.")
end
const output_images_path = path

using DifferentialEquations, Plots, Printf

const M1_0 = 4.7
const M2_0 = 4.2

const p_cr = 11.1
const N = 32
const q = 1
const tau_1 = 17
const tau_2 = 27
const p_1 = 7.7
const p_2 = 5.5

const a_1 = p_cr / (tau_1^2 * p_1^2 * N * q)
const a_2 = p_cr / (tau_2^2 * p_2^2 * N * q)
const b = p_cr / (tau_1^2 * p_1^2 * tau_2^2 * p_2^2 * N * q)
const c_1 = (p_cr - p_1) / (tau_1 * p_1)
const c_2 = (p_cr - p_2) / (tau_2 * p_2)

const u0 = [M1_0, M2_0]

function corporations(bias, tspan, title, label)
  function _corporations!(du, u, p, t)
    du[1] = u[1] - (b/c_1 + bias) * u[1] * u[2] - (a_1/c_1) * u[1]^2
    du[2] = (c_2/c_1) * u[2] - (b/c_1) * u[1] * u[2] - (a_2/c_1) * u[2]^2
  end

  prob = ODEProblem(_corporations!, u0, tspan)
  sol = solve(prob)

  plt = plot(sol, title=title, label=label)
  savefig(plt, string(output_images_path, "/", lowercase(replace(title, " "=>"_")), ".jl.png"))
end

corporations(0, [0, 30], "Case 1", ["Corp 1" "Corp 2"])
corporations(0.0005, [0, 30], "Case 2", ["Corp 1" "Corp 2"])
