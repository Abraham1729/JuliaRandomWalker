include("../src/Steps.jl")
include("../src/Vector2.jl")

### Tests for ComputeStepToward ###
# remember to test step size 0, 1, and beyond! -1, 2... 
source = Vector2(1.0, -1.0)
target = Vector2(2.0, 1.0)

# Test 1: 0 < step size
stepSize = 0.7
step = ComputeStepToward(source, target, stepSize)
step != Vector2((target.x - source.x) * stepSize, (target.y - source.y) * stepSize) && println("ComputeStepToward test 1 failed: Step factor = 0.7")

# Test 2: step size = 1
stepSize = 1.0
step = ComputeStepToward(source, target, stepSize)
step != target && println("ComputeStepToward test 2 failed: Step factor = 1")

# Test 3: step size = 0
stepSize = 0.0
step = ComputeStepToward(source, target, stepSize)
step != source && println("ComputeStepToward test 3 failed: Step factor = 0")

# Test 4: step size < 0
stepSize = -1.0
step = ComputeStepToward(source, target, stepSize)
step != -1 * (target - source) && println("ComputeStepToward test 4 failed: Step factor = -1")

### End tests for ComputeStepToward ###

### Tests for ComputeStepsWithBounds ###
stepCount = 100
numAnchors = 4
walker = Vector2(0.0, 0.0)
steps, bounds = ComputeStepsWithBounds(numAnchors, walker)

### End tests for ComputeStepsWithBounds ###