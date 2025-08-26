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
export StepToward

stepSize = 0.5 # Step size for each random walk step
anchors = GenerateAnchors(5, 1.0)
function ComputeStepsWithBounds(n::Int64, walker::Vector2)
    # Set up default bounds #
    upperRight = Vector2(walker.x, walker.y)
    lowerLeft = Vector2(walker.x, walker.y)
    # max_x = walker.x
    # min_x = walker.x
    # max_y = walker.y
    # min_y = walker.y

    # Create our array of locations visited by our walker #
    steps = Array{Vector2}(undef, n + 1)
    steps[0] = Vector2(walker.x, walker.y)

    # Do N steps, tracking the X/Y bounds for heatmap purposes #
    for i in 2:n+1
        # Compute the step & check the bounds #
        target = ChooseRandomAnchor(anchors)
        stepVector = ComputeStepToward(walker, target, stepSize)
        walker += stepVector
        steps[i] = Vector2(walker.x, walker.y)

        ## Update bounds ##
        # Update X bounds #
        if upperRight.x < walker.x
            upperRight.x = walker.x
        else
            if lowerLeft.x > walker.x
                lowerLeft.x = walker.x
            end
        end

        # Update Y bounds #
        if upperRight.y < walker.y
            upperRight.y = walker.y
        else 
            if lowerLeft.y > walker.y
                lowerLeft.y = walker.y
            end
        end 
    end

    # We're done here. Walker has been modified.
    # Bounds are described by upperRight and lowerLeft, which need to be returned
    # We also created an array of steps, which might need to be returned
    # We might want to have the steps array be passed in as an argument instead
    # TODO: Decide on return signature
    return steps
end
export ComputeStepsWithBounds