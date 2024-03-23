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

const N = 648
const u0 = [12]

function promotion(a_1, a_2, tspan, title)
  max_dn = -Inf
  time = -1
  function _promotion!(du, u, p, t)
     dn = (a_1(t) + a_2(t) * u[1]) * (N - u[1])
     if dn > max_dn
       max_dn = dn
       time = t
     end
     du[1] = dn
  end

  prob = ODEProblem(_promotion!, u0, tspan)
  sol = solve(prob)

  plt = plot(sol, title=title, label="Know about the product")
  savefig(plt, string(output_images_path, "/", lowercase(replace(title, " "=>"_")), ".jl.png"))

  @printf("Max dn for %s: %0.5f at %0.2f\n", title, max_dn, time)
end

tspan = (0, 50)
a_1(t) = 0.125
a_2(t) = 0.00002
promotion(a_1, a_2, tspan, "Campaign")

tspan = (0, 0.1)
a_1(t) = 0.000095
a_2(t) = 0.92
promotion(a_1, a_2, tspan, "Word of mouth")

tspan = (0, 0.2)
a_1(t) = sin(10 * t)
a_2(t) = 0.9 * t
promotion(a_1, a_2, tspan, "Both")
