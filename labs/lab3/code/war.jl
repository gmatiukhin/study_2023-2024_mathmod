using DifferentialEquations, Plots

# initial army sizes
const u0 = [200000, 119000]

t = (0, 10)

function model_war(du, u0, p, t)
  x = u0[1]
  y = u0[2]
  dx = -0.5*x - 0.8*y + sin(t + 5) + 1
  dy = -0.7*x - 0.5*y + cos(t + 3) + 1
  du[1] = dx
  du[2] = dy
end

function model_war_guerrilla(du, u0, p, t)
  x = u0[1]
  y = u0[2]
  dx = -0.5*x - 0.8*y + sin(10*t)
  dy = -0.3*x*y - 0.5*y + cos(10*t)
  du[1] = dx
  du[2] = dy
end

# Stop the model when one army size reaches zero
condition1(u, t, integrator) = u[1]
cb1 = ContinuousCallback(condition1, SciMLBase.terminate!)
condition2(u, t, integrator) = u[2]
cb2 = ContinuousCallback(condition2, SciMLBase.terminate!)

cb = CallbackSet(
  ContinuousCallback(condition1, SciMLBase.terminate!),
  ContinuousCallback(condition2, SciMLBase.terminate!)
)

war_prob = ODEProblem(model_war, u0, t, callback=cb)
war_sol = solve(war_prob, abstol=1e-15, dt=0.0001)
war_guerrilla_prob = ODEProblem(model_war_guerrilla, u0, t, callback=cb)
war_guerrilla_sol = solve(war_guerrilla_prob, abstol=1e-15, dt=0.0001)

function draw_plot(title, result)
  plt = plot(result, xaxis="t", yaxis="count",label=["X" "Y"], title=title, dpy=1000)
  savefig(plt, lowercase(string(replace(title, " "=>"_"), ".png")))
end

draw_plot("Regular troops only", war_sol)
draw_plot("Mixed regular and guerrilla troops", war_guerrilla_sol)
