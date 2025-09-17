# Start params #
using JuliaRandomWalker

# TODO: Figure out how to set a seed #
num_steps = 1000000
num_anchors = 6
stepSize = 1 - (1/2)
anchor_distance = 1.0
startLocation = Vector2(0.0, 0.0)
resX = 1000
resY = 1000
Run(num_steps, num_anchors, anchor_distance, startLocation, stepSize, resX, resY)