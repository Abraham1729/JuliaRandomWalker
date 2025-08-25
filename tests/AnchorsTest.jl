include("../src/Anchors.jl")

### Testing GenerateAnchors ###
# Params for anchor generation #
num_anchors = 4
distance = 2.0
rotation = pi / 2

# Create anchors with no theta offset #
anchors = GenerateAnchors(num_anchors, distance)
expectedX = [2.0, 0.0, -2.0, 0.0]
expectedY = [0.0, 2.0, 0.0, -2.0]

# Test for unexpected state #
for i in 1:num_anchors
    anchor = anchors[i]
    if !isapprox(anchor.x, expectedX[i], atol=1e-9) || !isapprox(anchor.y, expectedY[i], atol=1e-9)
        println("Warning: generated anchor for default theta does not match expectation.")
        println("Got: ($(anchor.x), $(anchor.y))")
        println("Expected: ($(expectedX[i]), $(expectedY[i]))")
        println()
    end
end


# Create anchors with theta offset of pi/2 #
rotatedAnchors = GenerateAnchors(num_anchors, distance, theta=rotation)
expectedX = [0.0, -2.0, 0.0, 2.0]
expectedY = [2.0, 0.0, -2.0, 0.0]

# Test for unexpected state #
for i in 1:num_anchors
    anchor = rotatedAnchors[i]
        if !isapprox(anchor.x, expectedX[i], atol=1e-9) || 
            !isapprox(anchor.y, expectedY[i], atol=1e-9)
        println("Warning: generated anchor for custom theta does not match expectation.")
        println("Got: ($(anchor.x), $(anchor.y))")
        println("Expected: ($(expectedX[i]), $(expectedY[i]))")
        println()
    end
end

### End test of GenerateAnchors ###


### Test ChooseRandomAnchor ###
randomAnchor = ChooseRandomAnchor(anchors)
!(randomAnchor in anchors) && println("Random anchor returned is not element of anchor array passed as argument.")

### End test of ChooseRandomAnchor ###
