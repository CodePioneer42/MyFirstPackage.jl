using MyFirstPackage
using Documenter

DocMeta.setdocmeta!(MyFirstPackage, :DocTestSetup, :(using MyFirstPackage); recursive=true)

makedocs(;
    modules=[MyFirstPackage],
    authors="CodePioneer42 <jtang163@connect.hkust-gz.edu.cn> and contributors",
    sitename="MyFirstPackage.jl",
    format=Documenter.HTML(;
        canonical="https://CodePioneer42.github.io/MyFirstPackage.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/CodePioneer42/MyFirstPackage.jl",
    devbranch="main",
)
