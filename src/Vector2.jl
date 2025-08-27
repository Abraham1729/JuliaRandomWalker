using StaticArrays
export Vector2

mutable struct Vector2
    data:: SVector{2, Float64}
end

# Constructors #
Vector2(x::Real, y::Real) = Vector2(SVector(Float64(x), Float64(y)))
Vector2(v::AbstractVector{<:Real}) = Vector2(SVector{2,Float64}(v))

# Member access #
Base.getindex(v::Vector2, i::Int) = v.data[i]
Base.getproperty(v::Vector2, s::Symbol) =
    s === :x ? v.data[1] :
    s === :y ? v.data[2] :
    getfield(v, s)

# Equality checks #
Base.:(==)(v1::Vector2, v2::Vector2) = v1.x == v2.x && v1.y == v2.y
Base.isapprox(v1::Vector2, v2::Vector2; atol=1e-8) = isapprox(v1.x, v2.x, atol=atol) && isapprox(v1.y, v2.y, atol=atol)


# Scalar Arithmetic #
Base.:*(a::Real, v::Vector2) = Vector2(a * v.x, a * v.y)
Base.:*(v::Vector2, a::Real) = Vector2(a * v.x, a * v.y)
Base.:/(v::Vector2, a::Real) = Vector2(v.x / a, v.y / a)
Base.:+(v1::Vector2, v2::Vector2) = Vector2(v1.x + v2.x, v1.y + v2.y)
Base.:-(v1::Vector2, v2::Vector2) = Vector2(v1.x - v2.x, v1.y - v2.y)
