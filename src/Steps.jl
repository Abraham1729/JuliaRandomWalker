# include("./Vector2.jl")
# include("./Anchors.jl")

function ComputeStepToward(source::Vector2, target::Vector2, stepSize::Float64)
    # Calculate direction vector
    dir_x = target.x - source.x
    dir_y = target.y - source.y
    dist = sqrt(dir_x^2 + dir_y^2)
    
    # Normalize direction and scale by step size
    if dist == 0
        return  # No movement if already at the target
    end
    step_x = dir_x * stepSize
    step_y = dir_y * stepSize
    
    # Update source position
    return Vector2(step_x, step_y)
end
export ComputeStepToward

function ComputeStepsWithBounds!(n::Int64, walker::Vector2)
    # Set up default bounds #
    upperRight = Vector2(walker.x, walker.y) # (maxX, maxY)
    lowerLeft = Vector2(walker.x, walker.y)  # (minX, minY)

    # Create our array of locations visited by our walker #
    steps = Array{Vector2}(undef, n + 1)
    steps[0] = Vector2(walker.x, walker.y)

    # Do N steps, tracking the X/Y bounds for heatmap purposes #
    for i in 2:n+1
        # Choose an anchor and take a step toward it #
        target = ChooseRandomAnchor(anchors)
        steps[i] = walker += ComputeStepToward(walker, target, stepSize)

        # Update X bounds as needed #
        upperRight.x < walker.x && upperRight.x = walker.x
        lowerLeft.x > walker.x && lowerLeft.x = walker.x

        # Update Y bounds as needed #
        upperRight.y < walker.y && upperRight.y = walker.y
        lowerLeft.y > walker.y && lowerLeft.y = walker.y
    end

    # Returning steps + tuple of bounds, leaving to end user to unpack #
    return (steps, (upperRight, lowerLeft))
end
export ComputeStepsWithBounds