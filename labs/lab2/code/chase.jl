using Plots
using DifferentialEquations

const sighting_distance = 7.5 
const cutter_speed_coef = 3.1
const phi = 2

const r0 = sighting_distance / (cutter_speed_coef + 1)
const r1 = sighting_distance / (cutter_speed_coef - 1)

const T0 = (0, 2*pi)
const T1 = (-pi, pi)

function chase_problem(r0, T)
  v_t = sqrt(cutter_speed_coef ^ 2 - 1)
  dr(r, p, theta) = r / v_t
  problem = ODEProblem(dr, r0, T)
  return solve(problem, abstol=1e-8, reltol=1e-8)
end

function draw_plot(title, result)
  plt = plot(proj=:polar, aspect_ratio=:equal, dpi = 1000, legend=:outerbottom, bg=:white, title=title)
  plot!(plt, result.t, result.u, label="Cutter's path")
  plot!(plt, [phi, phi], [0, last(result.u)], label="Boat's path")
  savefig(plt, lowercase(string(replace(title, " "=>"_"), ".png")))
end

# Case 1
result = chase_problem(r0, T0)
draw_plot("Case 1", result)

# Case 2
result = chase_problem(r1, T1)
draw_plot("Case 2", result)
