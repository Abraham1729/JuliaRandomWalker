function Run(
    num_steps::Int64, 
    num_anchors::Int64 = 3, 
    anchor_distance::Real = 10.0,
    startLocation::Vector2 = Vector2(0.0,0.0), 
    stepSize::Real = 0.5,
    resX::Int64 = 1000,
    resY::Int64 = 1000,
    )

    anchors = GenerateAnchors(num_anchors, anchor_distance)
    steps = ComputeSteps(num_steps, anchors, startLocation, stepSize)
    
    # Get bounds of sim #
    upperRight, lowerLeft = ComputeStepBounds(steps)
    dx = upperRight.x - lowerLeft.x
    dy = upperRight.y - lowerLeft.y
    worldSize = Vector2(dx, dy)
    
    # Get bounds of screen #
    screenDims = Vector2(resX, resY)
    
    # Get conversion factor as Vector2 # 
    screenScalingFactor = Vector2(screenDims.x / worldSize.x, screenDims.y / worldSize.y)
    epsilon = 0.0001
    
    # Compute visted pixels, populate screen #
    pixelX, pixelY = FitToScreen(steps, lowerLeft, screenScalingFactor, epsilon)
    screen = SetScreen(pixelX, pixelY, resX, resY)
    
    # Show the dang thing #
    heatmap(screen, color=:thermal, axis=nothing, legend=false, border=:none)
end
export Run