function GenerateAnchors(n::Int, distance::Float64)
    # Loop to create anchors
    anchors = Vector{Anchor}(undef, n)
    theta = 0.0
    for i in 1:n
        x = distance * cos(theta)
        y = distance * sin(theta)
        anchors[i] = Anchor(x, y)
        theta += 2 * π / n
    end
    return anchors
end

function ChooseRandomAnchor(anchors::Vector{Anchor})
    return anchors[rand(1:length(anchors))]
end