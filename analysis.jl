using JuliaRandomWalker
using Plots
using Gtk

# Initial positions and velocities
p1 = Structs.Planet(0.0, 0.0, 5.972e24)  # Earth
p2 = Structs.Planet(384400000.0, 0.0, 7.348e22)  # Moon

v1 = (0.0, 0.0)
v2 = (0.0, 1022.0)  # Approximate orbital velocity of Moon (m/s)
n_steps = 5000

x = [p1.x, p2.x]
y = [p1.y, p2.y]


plt = plot()

for i in 1:n_steps
    # Calculate accelerations
    a1 = Structs.GetAcceleration(p1, p2)
    a2 = Structs.GetAcceleration(p2, p1)

    # Update velocities
    global v1 = (v1[1] + a1[1]*Structs.dt, v1[2] + a1[2]*Structs.dt)
    global v2 = (v2[1] + a2[1]*Structs.dt, v2[2] + a2[2]*Structs.dt)

    # Update positions
    p1.x += v1[1]*Structs.dt
    p1.y += v1[2]*Structs.dt
    p2.x += v2[1]*Structs.dt
    p2.y += v2[2]*Structs.dt

    # Update plot
    plt = plot(xlims=(-4e8, 4e8), ylims=(-4e8, 4e8), legend=:topright)
    plot!(plt, [p1.x, p2.x], [p1.y, p2.y], seriestype=:scatter, markersize=[10,5], label=["Earth" "Moon"])
    display(plt)
    sleep(0.01)  # Slow down for visibility
end