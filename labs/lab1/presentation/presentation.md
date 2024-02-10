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

Создание пространства для выполнения последующих лабораторных работ.

# Выполнение лабораторной работы

## Создание репозитория на GitHub

```bash
$ gh repo create study_2023-2024_mathmod --template=yamadharma/course-directory-student-template --public
```

## Клонирование на компьютер

```bash
$ cd Study
$ git submodule add https://github.com/gmatiukhin/study_2023-2024_mathmod.git mathmod
$ git submodule update --init --recursive
```

## Создание структуры курса

```bash
$ cd mathmod
$ echo mathmod > COURSE
$ make prepare
```

## Отправка изменений на сервер

```bash
$ git add .
$ git commit -am 'feat(main): make course structure'
$ git push
```

# Выводы

Репозиторий готов к далбнейшей работе.
