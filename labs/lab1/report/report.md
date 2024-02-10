---
## Front matter
title: "Отчет по лабораторной работе 1"
subtitle: ""
author: "Матюхин Григорий Васильевич"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Создание пространства для выполнения последующих лабораторных работ.

# Выполнение лабораторной работы

## Создание репозитория на GitHub

Используя утилиту коммандной строки `gh` создадим репозиторий на GitHub по шаблону `yamadharma/course-directory-student-template`.

```bash
$ gh repo create study_2023-2024_mathmod --template=yamadharma/course-directory-student-template --public
Created repository gmatiukhin/study_2023-2024_mathmod on GitHub
```

## Клонирование на компьютер

Добавим созданный репозиторий как субмодуль в репозиторий учебы.

```bash
$ cd Study
$ git submodule add https://github.com/gmatiukhin/study_2023-2024_mathmod.git mathmod
Cloning into '/home/gmatiukhin/Study/mathmod'...
remote: Enumerating objects: 31, done.
remote: Counting objects: 100% (31/31), done.
remote: Compressing objects: 100% (30/30), done.
remote: Total 31 (delta 1), reused 16 (delta 0), pack-reused 0
Receiving objects: 100% (31/31), 18.38 KiB | 342.00 KiB/s, done.
Resolving deltas: 100% (1/1), done.
```

Обновим субмодули нашего репозитория.

```bash
$ git submodule update --init --recursive
Submodule 'template/presentation' (https://github.com/yamadharma/academic-presentation-markdown-template.git) registered for path 'template/presentation'
Submodule 'template/report' (https://github.com/yamadharma/academic-laboratory-report-template.git) registered for path 'template/report'
Cloning into '/home/gmatiukhin/Study/mathmod/template/presentation'...
Cloning into '/home/gmatiukhin/Study/mathmod/template/report'...
Submodule path 'template/presentation': checked out '40a1761813e197d00e8443ff1ca72c60a304f24c'
Submodule path 'template/report': checked out '7c31ab8e5dfa8cdb2d67caeb8a19ef8028ced88e'
```

## Создание структуры курса

Посмотрим доступные коммады Makefile.

```bash
$ cd mathmod
$ make help
Usage:
  make <target>

Targets:
  list                            List of courses
  prepare                         Generate directories structure
  submodule                       Update submules
```

Посмотрим список курсов.

```bash
$ make list
          net-admin  Администрирование локальных сетей
       net-os-admin  Администрирование сетевых подсистем
            arch-pc  Архитектура ЭВМ
      sciprog-intro  Введение в научное программирование
            infosec  Информационная безопасность
  computer-practice  Компьютерный практикум по статистическому анализу данных
            mathsec  Математические основы защиты информации и информационной безопасности
            mathmod  Математическое моделирование
simulation-networks  Моделирование сетей передачи данных
            sciprog  Научное программирование
           os-intro  Операционные системы
```

Выберем наш курс "Математическое моделирование" и создадим структуру для него.

```bash
$ echo mathmod > COURSE
$ make prepare
```

## Отправка изменений на сервер

Проиндексируем изменения и отправим их на сервер GitHub.

```bash
$ git add .
$ git commit -am 'feat(main): make course structure'
$ git push
```

# Выводы

Репозиторий готов к далбнейшей работе.
