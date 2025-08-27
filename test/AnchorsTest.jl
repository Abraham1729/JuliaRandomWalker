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
@testset verbose = true "Testing GenerateAnchors Without Rotations" begin
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

@testset "Testing GenerateAnchors With Rotations" begin 
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

### End test of GenerateAnchors ###