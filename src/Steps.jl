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

function ComputeStepsWithBounds(n::Int64, startLocation::Vector2, anchors:: Vector{Vector2}, stepSize::Float64 = 0.1)
    # Set up default bounds #
    upperRight = startLocation # (maxX, maxY)
    lowerLeft = startLocation  # (minX, minY)

    # Create our array of locations visited by our walker #
    steps = Array{Vector2}(undef, n + 1)
    steps[1] = startLocation

    # Do N steps, tracking the X/Y bounds for heatmap purposes #
    for i in 2:length(steps)
        # Choose an anchor and take a step toward it #
        target = ChooseRandomAnchor(anchors)
        steps[i] = steps[i-1] += ComputeStepToward(steps[i-1], target, stepSize)

        # Update X bounds as needed #
        upperRight.x < steps[i].x && (upperRight.x = steps[i].x)
        lowerLeft.x > steps[i].x && (lowerLeft.x = steps[i].x)

        # Update Y bounds as needed #
        upperRight.y < steps[i].y && (upperRight.y = steps[i].y)
        lowerLeft.y > steps[i].y && (lowerLeft.y = steps[i].y)
    end

    # Returning steps + tuple of bounds, leaving to end user to unpack #
    return (steps, (upperRight, lowerLeft))
end
export ComputeStepsWithBounds