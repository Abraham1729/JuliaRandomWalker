# Load dependencies #
using JuliaRandomWalker
using Test
using Pretend
Pretend.activate()

# Run tests #
@testset verbose = true "Running all tests" begin
    @testset "Vector2 Tests" include("Vector2Test.jl")
    @testset "Anchors Tests" include("AnchorsTest.jl")
    @testset "Steps Tests" include("StepsTest.jl")
end