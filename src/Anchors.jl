include("Point.jl")

function GenerateAnchors(n::Int, distance::Float64; theta = 0.0)
    # Loop to create anchors
    anchors = Vector{Point}(undef, n)
    for i in 1:n
        x = distance * cos(theta)
        y = distance * sin(theta)
        anchors[i] = Point(x, y)
        theta += 2 * π / n
    end
    return anchors
end

function ChooseRandomAnchor(anchors::Vector{Point})
    return anchors[rand(1:length(anchors))]
end