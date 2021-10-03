x += lengthdir_x(Speed, Direction)
y += lengthdir_y(Speed, Direction)

Speed /= 1.015

y += Velocity
Velocity += Gravity

if (y > 1200) {
	instance_destroy()
}