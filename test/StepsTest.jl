### Tests for ComputeStepToward ###
@testset verbose = true "Testing ComputeStepToward" begin
    @testset "ComputeStepToward with various step sizes" begin
        # Assemble #
        source = Vector2(1.0, -1.0)
        target = Vector2(2.0, 1.0)
        
        # Test 1: 0 < step size
        stepSize = 0.7
        step = ComputeStepToward(source, target, stepSize)
        @test step == stepSize * (target - source)

        # Test 2: step size = 1
        stepSize = 1.0
        step = ComputeStepToward(source, target, stepSize)
        @test step == (target - source)

        # Test 3: step size = 0
        stepSize = 0.0
        step = ComputeStepToward(source, target, stepSize)
        @test step == Vector2(0.0, 0.0)

        # Test 4: step size < 0
        stepSize = -1.0
        step = ComputeStepToward(source, target, stepSize)
        @test step == -1 * (target - source)
    end
end

### End tests for ComputeStepToward ###

# TODO: Tests for ComputeSteps
# TODO: Tests for ComputeStepBounds