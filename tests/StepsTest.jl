include("../src/Steps.jl")
include("../src/Vector2.jl")

### Tests for StepToward ###
# remember to test step size 0, 1, and beyond! -1, 2... 
source = Vector2(1.0, -1.0)
target = Vector2(2.0, 1.0)

# Test 1: 0 < step size
stepSize = 0.7
step = StepToward(source, target, stepSize)
step != Vector2((target.x - source.x) * stepSize, (target.y - source.y) * stepSize) && println("StepToward test 1 failed")

# Test 2: step size = 1
stepSize = 1.0
step = StepToward(source, target, stepSize)
step != target && println("StepToward test 2 failed")

# Test 3: step size = 0
stepSize = 0.0
step = StepToward(source, target, stepSize)
step != source && println("StepToward test 3 failed")

# Test 4: step size < 0
stepSize = -1.0
step = StepToward(source, target, stepSize)
# TODO: Debug this, check your def of multiplication for Vector2
step != -1 * (target - source) && println("StepToward test 4 failed")

### End tests for StepToward ###

### Tests for ComputeStepsWithBounds ###
### End tests for ComputeStepsWithBounds ###