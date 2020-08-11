/// @desc ScreenShake(magnitude, frames);
/// @arg magnitude sets strength of the shake
/// @arg frames sets the length of the shake in frames (60 = 1 sec)

with (obj_PlayerCamera) {
	// Checks if the biggest shake is happening
	// that will override the smaller shakes.
	if (argument0 > shake_remain) {
		shake_magnitude = argument0;
		shake_remain = argument0;
		shake_length = argument1;
	}
}