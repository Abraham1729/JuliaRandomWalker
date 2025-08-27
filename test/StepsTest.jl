### Begin tests for ComputeStepToward ###
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


### Begin tests for ComputeSteps ###
# TODO: Learn how to mock ChooseRandomAnchor for more controlled tests
### End tests for ComputeSteps ###


### Begin tests for ComputeStepBounds ###
@testset verbose=true "Testing ComputeStepBounds" begin
    @testset "ComputeStepBounds with various step patterns" begin
        # Test 1: Simple square pattern
        steps = [
            Vector2(0.0, 0.0), 
            Vector2(1.0, 0.0), 
            Vector2(1.0, 1.0), 
            Vector2(0.0, 1.0)
        ]
        upperRight, lowerLeft = ComputeStepBounds(steps)
        @test upperRight == Vector2(1.0, 1.0)
        @test lowerLeft == Vector2(0.0, 0.0)

        # Test 2: Negative coordinates
        steps = [
            Vector2(-2.0, -3.0), 
            Vector2(-1.0, -1.0), 
            Vector2(-4.0, -5.0)
        ]
        upperRight, lowerLeft = ComputeStepBounds(steps)
        @test upperRight == Vector2(-1.0, -1.0)
        @test lowerLeft == Vector2(-4.0, -5.0)

        # Test 3: Mixed coordinates
        steps = [
            Vector2(-1.0, 2.0), 
            Vector2(3.0, -4.0), 
            Vector2(0.0, 1.0)
        ]
        upperRight, lowerLeft = ComputeStepBounds(steps)
        @test upperRight == Vector2(3.0, 2.0)
        @test lowerLeft == Vector2(-1.0, -4.0)

        # Test 4: Single point
        steps = [
            Vector2(5.0, 5.0)
        ]
        upperRight, lowerLeft = ComputeStepBounds(steps)
        @test upperRight == Vector2(5.0, 5.0)
        @test lowerLeft == Vector2(5.0, 5.0)
    end
end
### End tests for ComputeStepBounds ###
