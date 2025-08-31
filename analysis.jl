# Start params #
# TODO: Figure out how to set a seed #
num_steps = 10000
num_anchors = 12
stepSize = 1 + 4/15
anchor_distance = 1.0
startLocation = Vector2(0.0, 0.0)

resX = 250
resY = 250
Run(num_steps, num_anchors, anchor_distance, startLocation, stepSize, resX, resY)
