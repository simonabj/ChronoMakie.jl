using ChronoMakie
using Documenter

DocMeta.setdocmeta!(ChronoMakie, :DocTestSetup, :(using ChronoMakie); recursive=true)

makedocs(;
    modules=[ChronoMakie],
    authors="Simon Andreas Bjørn <simonabj@ifi.uio.no> and contributors",
    repo="https://github.com/simonabj/ChronoMakie.jl/blob/{commit}{path}#{line}",
    sitename="ChronoMakie.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://simonabj.github.io/ChronoMakie.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/simonabj/ChronoMakie.jl",
    devbranch="main",
)
