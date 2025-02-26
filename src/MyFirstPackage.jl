module MyFirstPackage

# Write your package code here.
using TropicalNumbers, LinearAlgebra, Graphs

export shortest_path

function shortest_path(g::SimpleGraph)
    @show nv(g)
    return (map(x -> iszero(x) ? zero(TropicalMinPlus{Float64}) : TropicalMinPlus(1.0),
            adjacency_matrix(g)) + 
        Diagonal(fill(TropicalMinPlus(0.0), nv(g))))^nv(g)
end

end
