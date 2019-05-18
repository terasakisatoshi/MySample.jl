using Documenter, MySample

makedocs(;
    modules=[MySample],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/terasakisatoshi/MySample.jl/blob/{commit}{path}#L{line}",
    sitename="MySample.jl",
    authors="SatoshiTerasaki <terasakisatoshi.math@gmail.com>",
    assets=String[],
)

deploydocs(;
    repo="github.com/terasakisatoshi/MySample.jl",
)
