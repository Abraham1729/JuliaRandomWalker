using Test
@testset verbose = false "tinkering with test sets:" begin
    @test 5 == 5
    @test 4 == 4
    @test 3 == 5
    @test 2 == 3
    @test 4 == 4
end