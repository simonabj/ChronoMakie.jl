module ChronoMakie

export DateAxis, TimeAxis, DateTimeAxis

# Write your package code here.
function DateAxis(args; dateformat = "dd-mm-yyyy" , kwargs...)
    x_fmt = value -> Dates.format.(Date(0,12,31)+Day.(value), dateformat)
    return Axis(args; xtickformat = x_fmt, kwargs...)
end

function TimeAxis(args; timeformat = "HH:MM:SS", kwargs...)
    x_fmt = value -> Dates.format.(Time(0)+Nanosecond.(value), timeformat)
    return Axis(args; xtickformat = x_fmt, kwargs...)
end

function DateTimeAxis(args; datetimeformat = "dd-mm-yyyy HH:MM:SS", kwargs...)
    x_fmt = value -> Dates.format.(DateTime(0,12,31)+Millisecond.(value.+62135683200000), datetimeformat)
    # x_fmt = value -> map(e->"$e", value)
    return Axis(args; xtickformat = x_fmt, kwargs...)
end

Makie.convert_arguments(P::PointBased, x::AbstractArray{Date}, y) = convert_arguments(P, map(e->e.instant.periods.value,x), y)
Makie.convert_arguments(P::PointBased, x::AbstractArray{Time}, y) = convert_arguments(P, map(e->e.instant.value, x), y)
Makie.convert_arguments(P::PointBased, x::AbstractArray{DateTime}, y) = convert_arguments(P, map(e->e.instant.periods.value-62135683200000, x), y)

end
