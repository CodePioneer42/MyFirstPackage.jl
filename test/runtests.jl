
using Test
using TropicalNumbers, LinearAlgebra, Graphs

@testset "MyFirstPackage.jl" begin

   # Test 1: Simple graph with 3 vertices and 2 edges
   g1 = SimpleGraph(3)
   add_edge!(g1, 1, 2)
   add_edge!(g1, 2, 3)

   result1 = shortest_path(g1)
   @test size(result1) == (3, 3)  # Result should be a 3x3 matrix
   @test result1[1, 3].n == TropicalMinPlus(2.0).n  # Shortest path from 1 to 3 is length 2

   # Test 2: Petersen graph (a well-known graph with 10 vertices)
   g2 = smallgraph(:petersen)
   result2 = shortest_path(g2)
   @test size(result2) == (10, 10)  # Result should be a 10x10 matrix

   # Verify some known shortest paths in the Petersen graph
   @test result2[1, 6].n == TropicalMinPlus(2.0).n  # Distance between vertex 1 and 6 is 2
   @test result2[1, 10].n == TropicalMinPlus(2.0).n # Distance between vertex 1 and 10 is 2

#    # Test 3: Empty graph (no edges)
#    g3 = SimpleGraph(4)
#    result3 = shortest_path(g3)
#    @test all(iszero.(result3 .- Diagonal(fill(TropicalMinPlus(0.0), 4))))  # Should be identity matrix

#    # Test 4: Complete graph (all vertices are connected)
#    g4 = CompleteGraph(4)
#    result4 = shortest_path(g4)
#    @test all(result4 .== TropicalMinPlus(1.0))  # All distances should be 1 (direct connections)

   # Test 5: Graph with a single vertex
   g5 = SimpleGraph(1)
   result5 = shortest_path(g5)
   @test size(result5) == (1, 1)  # Result should be a 1x1 matrix
   @test result5[1, 1] == TropicalMinPlus(0.0)  # Distance to itself is 0

#    # Test 6: Disconnected graph
#    g6 = SimpleGraph(5)
#    add_edge!(g6, 1, 2)
#    add_edge!(g6, 3, 4)
#    result6 = shortest_path(g6)
#    @test result6[1, 3].n == TropicalMinPlus(-Inf).n  # No path exists between disconnected components


    # # Test 1: Simple graph with 3 vertices and 2 edges
    # g1 = SimpleGraph(5)
    # add_edge!(g1, 1, 2)
    # add_edge!(g1, 1, 2)
    # add_edge!(g1, 2, 3)
    # add_edge!(g1, 2, 4)
    # add_edge!(g1, 3, 5)
    # add_edge!(g1, 4, 5)
    # result7 = shortest_path(g1)
    # @test size(result1) == (3, 3)  # Result should be a 3x3 matrix
    # @test result1[1, 3].n == TropicalMinPlus(2.0).n  # Shortest path from 1 to 3 is length 2
end
