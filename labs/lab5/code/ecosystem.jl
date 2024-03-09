using DifferentialEquations, Plots

const tspan = (0, 400)
const u0 = [4, 9]
const dt = 0.1

const a = 0.77
const b = 0.33
const c = 0.077
const d = 0.033

function predator_prey!(du, u, p, t)
  x = u[1]
  y = u[2]
  du[1] = -a * x + c * x * y
  du[2] = b * y - d * x * y
end

prob = ODEProblem(predator_prey!, u0, tspan, dt=dt)
sol = solve(prob)

plt = plot(sol)
savefig(plt, "population_change.png")

_plt = plot(sol, idxs = (1,2))
savefig(_plt, "predator_prey_dependency.png")
