mutable struct Vector2
    x::Float64
    y::Float64
end
export Vector2

function Base.:+(p1::Vector2, p2::Vector2)
    return Vector2(p1.x + p2.x, p1.y + p2.y)
end

function Base.:-(p1::Vector2, p2::Vector2)
    return Vector2(p1.x - p2.x, p1.y - p2.y)
end

function Base.:(==)(p1::Vector2, p2::Vector2)
    return p1.x == p2.x && p1.y == p2.y
end

# TODO: Check if this makes sense, getting errors in tests
function Base.:*(scalar::Float64, p::Vector2)
    return Vector2(scalar * p.x, scalar * p.y)
end

function Base.:*(p::Vector2, scalar::Float64)
    return Vector2(scalar * p.x, scalar * p.y)
end

function Base.:*(scalar::Int64, p::Vector2)
    return Vector2(scalar * p.x, scalar * p.y)
end

function Base.:*(p::Vector2, scalar::Int64)
    return Vector2(scalar * p.x, scalar * p.y)
end

function Base.isapprox(p1::Vector2, p2::Vector2; atol=1e-8)
    return isapprox(p1.x, p2.x, atol=atol) && isapprox(p1.y, p2.y, atol=atol)
end