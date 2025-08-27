# include("Vector2.jl")

function GenerateAnchors(
    n::Int, 
    distance::Real = 1; 
    theta = 0.0
    )

    # Loop to create anchors
    anchors = Vector{Vector2}(undef, n)
    for i in 1:n
        x = distance * cos(theta)
        y = distance * sin(theta)
        anchors[i] = Vector2(x, y)
        theta += 2 * π / n
    end
    return anchors
end
export GenerateAnchors

function ChooseRandomAnchor(
    anchors::Vector{Vector2}
    )
    
    return anchors[rand(1:length(anchors))]
end
export ChooseRandomAnchor