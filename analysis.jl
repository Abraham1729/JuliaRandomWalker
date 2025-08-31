# Start params #
# TODO: Figure out how to set a seed #
num_steps = 1000000
num_anchors = 5
stepSize = 0.5
anchor_distance = 10.0
startLocation = Vector2(0.0, 0.0)

resX = 1000
resY = 1000

Run(num_steps, num_anchors, anchor_distance, startLocation, stepSize, resX, resY)