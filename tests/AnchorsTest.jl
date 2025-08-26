include("../src/Anchors.jl")

### Testing GenerateAnchors ###
# Params for anchor generation #
num_anchors = 4
distance = 2.0
rotation = pi / 2

# Create anchors with no theta offset #
anchors = GenerateAnchors(num_anchors, distance)

expectedAnchors = [
    Vector2(2.0, 0.0),
    Vector2(00.0, 2.0),
    Vector2(-2.0, 0.0),
    Vector2(0.0, -2.0)
]

# Test for unexpected state #
for i in 1:num_anchors
    anchor = anchors[i]
    if !isapprox(anchor, expectedAnchors[i])
        println("Test 1 failed: generated anchor for default theta does not match expectation.")
        println("Got: $anchor")
        println("Expected: $(expectedAnchors[i])")
        println()
    end
end


# Create anchors with theta offset of pi/2 #
rotatedAnchors = GenerateAnchors(num_anchors, distance, theta=rotation)
expectedRotateddAnchors = [
    Vector2(0.0, 2.0),
    Vector2(-2.0, 0.0),
    Vector2(0.0, -2.0),
    Vector2(2.0, 0.0)
]

# Test for unexpected state #
for i in 1:num_anchors
    anchor = rotatedAnchors[i]
        if !isapprox(anchor, expectedRotateddAnchors[i])
        println("Test 2 Failed: generated anchor for default theta does not match expectation.")
        println("Got: $anchor")
        println("Expected: $(expectedRotatedAnchors[i])")
        println()
    end
end

### End test of GenerateAnchors ###


### Test ChooseRandomAnchor ###
randomAnchor = ChooseRandomAnchor(anchors)
!(randomAnchor in anchors) && println("Random anchor returned is not element of anchor array passed as argument.")

### End test of ChooseRandomAnchor ###
