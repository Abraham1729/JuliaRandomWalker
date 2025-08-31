function FitToScreen(
    steps::Vector{Vector2}, 
    lowerLeft::Vector2, 
    screenScalingFactor::Vector2, 
    epsilon::Float64 = 0.0001
    )
    
    # Scale steps to screen size #
    pixelX = Vector{Int64}(undef, length(steps))
    pixelY = Vector{Int64}(undef, length(steps))
    for i in 1:length(steps)
        # Translate & Scale to move to screen space #
        screenScaledX = (steps[i].x - lowerLeft.x) * screenScalingFactor.x
        screenScaledY = (steps[i].y - lowerLeft.y) * screenScalingFactor.y
        
        # Transform into pixel space (1-indexed). Epsolon scaling fixes out of bounds indexing issue for the two steps on the X/Y boundary #
        pixelX[i] = floor(screenScaledX * (1 - epsilon)) + 1
        pixelY[i] = floor(screenScaledY * (1 - epsilon)) + 1
    end

    return (pixelX, pixelY)
end
export FitToScreen

function SetScreen(
    pixelX::Vector{Int64}, 
    pixelY::Vector{Int64}, 
    xScreenDim::Int64, 
    yScreenDim::Int64
    )

    # Create our screen array #
    screen = Array{Int64}(undef, xScreenDim, yScreenDim)
    fill!(screen, 0)

    # Plot each step on the screen #
    for i in 1:length(pixelX)
        screen[pixelX[i], pixelY[i]] += 1
    end

    return screen
end
export SetScreen
