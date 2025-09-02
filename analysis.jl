# Start params #
# TODO: Figure out how to set a seed #
num_steps = 10000000
num_anchors = 6
stepSize = 1/2
anchor_distance = 1.0
startLocation = Vector2(0.0, 0.0)
resX = 500
resY = 500

Run(num_steps, num_anchors, anchor_distance, startLocation, stepSize, resX, resY)
# TODO: gks qtterm -- find out how to GUI for zooming and panning so you can show off to Henry and not look like a fool #

