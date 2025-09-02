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

    # Replacing my Vec2s with floats for better performance #
    maxX = steps[1].x
    minX = steps[1].x
    maxY = steps[1].y
    minY = steps[1].y

    # Loop through all steps to find bounds
    for step in steps
        # Update X bounds as needed #
        (maxX < step.x) && (maxX = step.x)
        (minX > step.x) && (minX = step.x)

        # Update Y bounds as needed #
        (maxY < step.y) && (maxY = step.y)
        (minY > step.y) && (minY = step.y)
    end

    return (Vector2(maxX, maxY), Vector2(minX, minY))
end
export ComputeStepBounds