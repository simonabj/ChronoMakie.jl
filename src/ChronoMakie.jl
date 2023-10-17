module ChronoMakie

using Makie, Dates

export DateAxis, TimeAxis, DateTimeAxis
export date2float, time2float, datetime2float

# Write your package code here.
function DateAxis(args; dateformat = "dd-mm-yyyy" , kwargs...)
    # Crete a clojure which runs on each tick value
    x_fmt = values -> map( # The function maps each value to a string
        value -> value % 1 == 0 ? # If the value is an integer
            Dates.format.(Date(0,12,31)+Day.(value), dateformat) : # Use Date format
            "", # else use an empty string
        values
    )
    return Axis(args; xtickformat = x_fmt, kwargs...)
end

function TimeAxis(args; timeformat = "HH:MM:SS.sss", kwargs...)
    # Allow time to use float, as the precision is smaller than milliseconds.
    x_fmt = value -> Dates.format.(Time(0)+Nanosecond.(value), timeformat)
    return Axis(args; xtickformat = x_fmt, kwargs...)
end

function DateTimeAxis(args; datetimeformat = "dd-mm-yyyy HH:MM:SS", kwargs...)
    # Date time should be used when the precision is higher than seconds, and allow for floats as millis.
    x_fmt = value -> Dates.format.(DateTime(0,12,31)+Millisecond.(value.+62135683200000), datetimeformat)
    # x_fmt = value -> map(e->"$e", value)
    return Axis(args; xtickformat = x_fmt, kwargs...)
end

date2float(date::Date) = date.instant.periods.value
time2float(time::Time) = time.instant.value
datetime2float(datetime::DateTime) = datetime.instant.periods.value-62135683200000

Makie.convert_arguments(P::PointBased, x::AbstractArray{Date}, y) = convert_arguments(P, map(date2float,x), y)
Makie.convert_arguments(P::PointBased, x::AbstractArray{Time}, y) = convert_arguments(P, map(time2float, x), y)
Makie.convert_arguments(P::PointBased, x::AbstractArray{DateTime}, y) = convert_arguments(P, map(datetime2float, x), y)

end
