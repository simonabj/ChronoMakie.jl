# ChronoMakie

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://simonabj.github.io/ChronoMakie.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://simonabj.github.io/ChronoMakie.jl/dev/)
[![Build Status](https://github.com/simonabj/ChronoMakie.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/simonabj/ChronoMakie.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/simonabj/ChronoMakie.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/simonabj/ChronoMakie.jl)

It's Time Makie was able to plot Dates.

This package is some plotting recipes to handle TimeStamp, Date and Time as provided from `Dates.jl`.

## Installation
```
pkg> add https://github.com/simonabj/ChronoMakie.jl 
```

## Basic Usage
```
using GLMakie, Dates

# 10 days from 2023-01-01 to 2023-01-10
xs1 = Date(2023, 1, 1):Date(2023, 1, 10) 

# 10 hours from 03:00:00 to 12:00:00
xs2 = Time(3,0,0):Hour(1):Time(12,0,0)   

# 10 hours from 03:00:00 to 12:00:00 at the date 2023-10-17
xs3 = DateTime(2023, 10, 17, 3, 0, 0):Hour(1):DateTime(2023, 10, 17, 12, 0, 0)

ys1,ys2,ys3 = [rand(10), rand(10), rand(10)]

F = Figure()
ax1 = DateAxis(F[1,1], dateformat="yyyy-mm-dd")
ax2 = TimeAxis(F[2,1], timeformat="HH:MM:SS")
ax3 = DateTimeAxis(F[1,1], datetimeformat="yyyy-mm-dd HH:MM:SS")
lines!(ax1, xs1, ys1)
lines!(ax2, xs2, ys2)
lines!(ax3, xs3, ys3)

```