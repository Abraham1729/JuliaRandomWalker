@testset verbose = true "Testing scalar operators" begin
    @testset "Scalar-Vector multiplcation (LHS + RHS)" begin
        @test 2 * Vector2(1.0, 2.0) == Vector2(2.0, 4.0)
        @test Vector2(1.0, 2.0) * 2.0 == Vector2(2.0, 4.0)
    end

    @testset "Addition & Subtraction of Vectors" begin
        @test Vector2(1.0, 2.0) + Vector2(3.0, 4.0) == Vector2(4.0, 6.0)
        @test Vector2(1.0, 2.0) - Vector2(3.0, 4.0) == Vector2(-2.0, -2.0)
    end

    @testset "Equality & IsApprox" begin
        @test Vector2(1.0, 2.0) == Vector2(1.0, 2.0)
        @test Vector2(1.0, 2.0) != Vector2(1.0, 3.0)
        @test isapprox(Vector2(1.0, 2.0), Vector2(1.0, 2.0 + 1e-10))
        @test !isapprox(Vector2(1.0, 2.0), Vector2(1.0, 3.0))
    end
end