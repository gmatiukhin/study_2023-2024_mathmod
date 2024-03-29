---
## Front matter
lang: ru-RU
title: Презентация по лабораторной работе 1 
subtitle: 
author:
  - Матюхин Г. В.
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 10 февраля 2024

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - \usepackage{fvextra}
 - \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

# Цель работы

Решить задачу о погоне используя Openmodelica и Julia.

# Постановка задачи

Мой вариант: $1032211403 \% 70 + 1 = 14$

На море в тумане катер береговой охраны преследует лодку браконьеров. Через определенный промежуток времени туман рассеивается, и лодка обнаруживается на расстоянии 7,5 км от катера. Затем лодка снова скрывается в тумане и уходит прямолинейно в неизвестном направлении. Известно, что скорость
катера в 3,1 раза больше скорости браконьерской лодки.
1. Запишите уравнение, описывающее движение катера, с начальными условиями для двух случаев (в зависимости от расположения катера относительно лодки в начальный момент времени).
2. Постройте траекторию движения катера и лодки для двух случаев.
3. Найдите точку пересечения траектории катера и лодки

# Выполнение лабораторной работы

## Решение задачи (1/6)
1. Принимаем за $t_0 = 0, x_{b0} = 0$ -- место нахождения лодки браконьеров в
момент обнаружения, $x_{c0} = 0$ -- место нахождения катера береговой охраны
относительно лодки браконьеров в момент обнаружения лодки.

## Решение задачи (2/6)
2. Введем полярные координаты. Считаем, что полюс -- это точка обнаружения лодки браконьеров $x_{b0} (\theta = x_{b0} = 0)$, а полярная ось $r$ проходит через точку нахождения катера береговой охраны.

## Решение задачи (3/6)
3. Траектория катера должна быть такой, чтобы и катер, и лодка все время были на одном расстоянии от полюса $\theta$ , только в этом случае траектория катера пересечется с траекторией лодки.
Поэтому для начала катер береговой охраны должен двигаться некоторое время прямолинейно, пока не окажется на том же расстоянии от полюса, что и лодка браконьеров. После этого катер береговой охраны должен двигаться вокруг полюса удаляясь от него с той же скоростью, что и лодка браконьеров.

## Решение задачи (4/6)
4. Чтобы найти расстояние $x$ (расстояние после которого катер начнет двигаться вокруг полюса), необходимо составить простое уравнение. Пусть через время $t$ катер и лодка окажутся на одном расстоянииx от полюса. За это время лодка пройдет $x$ , а катерk $k - x$ (или $k + x$ , в зависимости от начального положения катера относительно полюса). Время, за которое они пройдут это расстояние, вычисляется как $x \div v% или $(k - x) \div 3.1v$ (во втором случае $(k + x) \div 3.1v$ ). Так как время одно и то же, то эти величины одинаковы. Тогда неизвестное расстояниеx можно найти из следующего уравнения:

$\frac{x}{v} = \frac{k - x}{3.1v}$ в первом случае
или
$\frac{x}{v} = \frac{k + x}{3.1v}$ во втором.

Отсюда мы найдем два значения $x_1 = \frac{k}{4.1}$ и $x_2 = \frac{k}{2.1}$, задачу будем решать для двух случаев.

## Решение задачи (5/6)
5. После того, как катер береговой охраны окажется на одном расстоянии от полюса, что и лодка, он должен сменить прямолинейную траекторию и начать двигаться вокруг полюса удаляясь от него со скоростью лодки $v$. Для этого скорость катера раскладываем на две составляющие: $r_v$ -- радиальная скорость и $v_t$ -- тангенциальная скорость.
Радиальная скорость -- это скорость, с которой катер удаляется от полюса, $v_r = \frac{dr}{dt}$. Нам нужно, чтобы эта скорость была равна скорости лодки, поэтому полагаем $\frac{dr}{dt} = v$.
Тангенциальная скорость -- это линейная скорость вращения катера относительно полюса. Она равна произведению угловой скорости $\frac{d\theta}{dt}$ на радиус $r$, $v_t = r\frac{d\theta}{dt}$.
$v_t = \sqrt{(4.1v)^2 - v^2} = v\sqrt{15.81}$ (учитывая, что радиальная скорость равна $v$ ). Тогда получаем $r\frac{d\theta}{dt} = v\sqrt{15.81}$.

## Решение задачи (6/6)
6. Решение исходной задачи сводится к решению системы из двух
дифференциальных уравнений

$\begin{cases} \frac{dr}{dt} = v \\ r\frac{d\theta}{dt} = v\sqrt{15.81} \end{cases}$

с начальными условиями

$\begin{cases} \theta_0 = 0 \\ r_0 = x_1 \end{cases}$

или

$\begin{cases} \theta_0 = -\pi \\ r_0 = x_2 \end{cases}$
Исключая из полученной системы производную по t, можно перейти к
следующему уравнению:

$\frac{dr}{d\theta} = \frac{r}{\sqrt{15.81}}$

Начальные условия остаются прежними. Решив это уравнение, вы получите
траекторию движения катера в полярных координатах.

## Код программы

```julia
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

# Case 1
result = chase_problem(r0, T0)

# Case 2
result = chase_problem(r1, T1)
```

## Результаты выполнения

### Первый случай
![case1](../code/case_1.png)

### Второй случай
![case2](../code/case_1.png)

# Выводы
Мы смогли реализовать решение задачи о погоне.
