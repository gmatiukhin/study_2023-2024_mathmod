using DifferentialEquations, Plots

const u0 = [1, 0]
const tspan = (0, 45)
const dt = 0.05

function oscillation(title, g, w2, f)
  function _oscillation!(du, u, p, t)
    x = u[1]
    dx = u[2]
    du[1] = dx
    du[2] = - g * dx - w2 * x - f(t)
  end

  prob = ODEProblem(_oscillation!, u0, tspan,)
  sol = solve(prob, Tsit5(), dt=dt)

  plt = plot(sol, title=string(title, " pendulum"))
  savefig(plt, lowercase(string(replace(title, " "=>"_"), "_pendulum.png")))

  _prob = ODEProblem(prob.f, u0, tspan)
  _sol = solve(_prob, Vern9())

  _plt = plot(_sol, vars = (1,2), title=string(title, " phase space"))
  savefig(_plt, lowercase(string(replace(title, " "=>"_"), "_phase.png")))
end

f(t) = 0
oscillation("Simple", 0, 6, f)

oscillation("Fading", 5, 15, f)

f(t) = cos(3.5 * t)
oscillation("Force Fading", 2, 4, f)
