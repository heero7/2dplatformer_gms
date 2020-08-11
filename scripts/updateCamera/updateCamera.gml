/// @description Adjust the camera during gameplay.
/// @param lock_x
/// @param lock_y
/// @param x_cord
/// @param y_cord

// Update X-Axis
if (argument0 == true) {
	lock_x = true;
	y_cord = argument3;
} else {
	lock_x = false;
}

if (argument1 == true) {
	lock_y = true;
	x_cord = argument2;
} else {
	lock_y = false;
}


// Set unlocked X/Y coordinates
if (!argument0 && !argument1) {
	x_cord = argument2;
	y_cord = argument3;
}