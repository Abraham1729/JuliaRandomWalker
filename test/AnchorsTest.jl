include("../src/Vector2.jl")
include("../src/Anchors.jl")
using Test
using Mocking

Mocking.activate()

### Testing GenerateAnchors ###
# Helper test function #
function testGeneratedAnchors(anchors::Array{Vector2,1}, expectedAnchors::Array{Vector2,1})
    for i in 1:length(anchors)
        anchor = anchors[i]
        expected = expectedAnchors[i]
        !isapprox(anchor, expected) && return false
    end
    return true
end

# Assert #
@testset verbose = true "Testing GenerateAnchors" begin
    @testset "No rotations" begin 
        # Assemble #
        num_anchors = 4
        distance = 2.0
        rotation = pi / 2
        expectedAnchors = [
            Vector2(2.0, 0.0),
            Vector2(0.0, 2.0),
            Vector2(-2.0, 0.0),
            Vector2(0.0, -2.0)
        ]
        
        # Act #
        anchors = GenerateAnchors(num_anchors, distance)

        # Assert #
        @test testGeneratedAnchors(anchors, expectedAnchors)
    end

    @testset "With Rotations" begin 
        # Assemble #
        num_anchors = 4
        distance = 2.0
        rotation = pi / 2
        expectedRotatedAnchors = [
            Vector2(0.0, 2.0),
            Vector2(-2.0, 0.0),
            Vector2(0.0, -2.0),
            Vector2(2.0, 0.0)
        ]
        
        # Act #
        rotatedAnchors = GenerateAnchors(num_anchors, distance, theta=rotation)

        # Assert #
        @test testGeneratedAnchors(rotatedAnchors, expectedRotatedAnchors)
    end
end
### End test of GenerateAnchors ###


### Test ChooseRandomAnchor ###
@testset verbose = true "Testing ChooseRandomAnchor" begin 
    @testset "Mocked Random Choice, 2+ anchors" begin 
        # Assemble #
        num_anchors = 4
        distance = 2.0
        anchors = GenerateAnchors(num_anchors, distance)
        expectedAnchors = [
            Vector2(2.0, 0.0),
            Vector2(0.0, 2.0),
            Vector2(-2.0, 0.0),
            Vector2(0.0, -2.0)
        ]
    
        @patch rand(1:4) => 2 begin
            # Act #
            rancomAnchor = ChooseRandomAnchor(anchors)
        
            # Assert #
            @test isapprox(rancomAnchor, expectedAnchors[2])
            
        end 
        # @mock rand(1:4) => 2 begin
        # end
    end

    @testset "Mocked Random Choice, 1 anchor" begin 
        # Assemble #
        num_anchors = 1
        distance = 2.0
        anchors = GenerateAnchors(num_anchors, distance)
        expectedAnchors = [
            Vector2(2.0, 0.0)
        ]
    
        @patch rand(1:1) => 1 begin
            # Act #
            rancomAnchor = ChooseRandomAnchor(anchors)

            # Assert #
            @test isapprox(rancomAnchor, expectedAnchors[1])
        end
    end

    @testset "Mocked Random Choice, 0 anchors" begin 
        # Assemble #
        anchors = Vector{Vector2}(undef, 0) # Empty array
    
        # Act & Assert #
        @test_throws BoundsError ChooseRandomAnchor(anchors)
    end

end
### End test of ChooseRandomAnchor ###