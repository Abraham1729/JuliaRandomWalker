include("../src/Steps.jl")
include("../src/Point.jl")

### Tests for StepToward ###
stepSize = 0.7
# remember to test step size 0, 1, and beyond! -1, 2... 
source = Point(0.0, 0.0)
target = Point(2.0, 1.0)

step = StepToward(source, target, stepSize)
println(step)

### End tests for StepToward ###

### Tests for ComputeStepsWithBounds ###
### End tests for ComputeStepsWithBounds ###