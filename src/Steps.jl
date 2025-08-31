function ComputeStepToward(
    source::Vector2, 
    target::Vector2, 
    stepSize::Float64
    )

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

function ComputeSteps(
    n::Int64, 
    anchors:: Vector{Vector2}, 
    startLocation::Vector2 = Vector2(0.0,0.0), 
    stepSize::Float64 = 0.5
    )

    # Create our array of locations visited by our walker #
    steps = Array{Vector2}(undef, n)
    steps[1] = startLocation

    # Do N steps, tracking the X/Y bounds for heatmap purposes #
    for i in 2:length(steps)
        # Choose an anchor and take a step toward it #
        target = ChooseRandomAnchor(anchors)
        steps[i] = steps[i-1] + ComputeStepToward(steps[i-1], target, stepSize)
    end

    # Return generated steps array #
    return steps
end
export ComputeSteps

function ComputeStepBounds(
    steps::Vector{Vector2}
    )

    # Initialize bounds using the first step
    upperRight = deepcopy(steps[1]) # (maxX, maxY)
    lowerLeft = deepcopy(steps[1])  # (minX, minY)

    # Loop through all steps to find bounds
    for step in steps
        # Update X bounds as needed #
        (upperRight.x < step.x) && (upperRight.x = step.x)
        (lowerLeft.x > step.x) && (lowerLeft.x = step.x)

        # Update Y bounds as needed #
        (upperRight.y < step.y) && (upperRight.y = step.y)
        (lowerLeft.y > step.y) && (lowerLeft.y = step.y)
    end

    return (upperRight, lowerLeft)
end
export ComputeStepBounds