function StepToward(source::Point, target::Point, stepSize::Float64)
    # Calculate direction vector
    dir_x = target.x - source.x
    dir_y = target.y - source.y
    dist = sqrt(dir_x^2 + dir_y^2)
    
    # Normalize direction and scale by step size
    if dist == 0
        return  # No movement if already at the target
    end
    step_x = (dir_x / dist) * stepSize
    step_y = (dir_y / dist) * stepSize
    
    # Update source position
    return (step_x, step_y)
end

stepSize = 0.5 # Step size for each random walk step
anchors = GenerateAnchors(5, 1.0)
function ComputeStepsWithBounds(n::Int64, walker::Point)
    # Set up default bounds #
    max_x = walker.x
    min_x = walker.x
    max_y = walker.y
    min_y = walker.y

    # Create our array of locations visited by our walker #
    steps = zeros(n + 1,2)
    steps[0,0] = walker.x
    steps[0,1] = walker.y


    # Do N steps, tracking the X/Y bounds for heatmap purposes #
    for i in 2:n+1
        # Compute the step & check the bounds #
        target = ChooseRandomAnchor(anchors)
        stepVector = StepToward(walker, target, stepSize)
        walker.x += stepVector[0]
        walker.y += stepVector[1]
        # TODO: Decide if we can trim this down to just the steps array #
        steps[i,0] = walker.x
        steps[i,1] = walker.y

        ## Update bounds ##
        # Update X bounds #
        if max_x < walker.x
            max_x = walker.x
        else 
            if min_x > walker.x
                min_x = walker.x
            end
        end

        # Update Y bounds #
        if max_y < walker.y
            max_y = walker.y
        else 
            if min_y > walker.y
                max_y = walker.y
            end
        end 
    end

    # We're done here. Walker has been modified.
    # More importantly, we have an array of steps we can use
    return steps
end