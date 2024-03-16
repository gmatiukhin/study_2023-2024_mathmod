using DifferentialEquations, Plots

const tspan = (0, 50)
const N = 19500
const I0 = 88
const R0 = 25
const S0 = N - I0 - R0

const u0 = [S0, I0, R0]

function epidemic(a, b, title)
  function _epidemic!(du, u, p, t)
    du[1] = - a * u[1] # Susceptiblel
    du[2] = a * u[1] - b * u[2] # Infectious
    du[3] = b * u[2] # Recovered
  end

  prob = ODEProblem(_epidemic!, u0, tspan)
  sol = solve(prob)

  plt = plot(sol, label=["S" "I" "R"], color=[:red :blue :green])
  savefig(plt, lowercase(string(replace(title, " "=>"_"), ".png")))
end

a = 0.1
b = 0.2
epidemic(a, b, "Contageous")
epidemic(0, b, "Noncontageous")
