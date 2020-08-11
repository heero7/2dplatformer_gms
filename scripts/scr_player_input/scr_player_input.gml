/// @description Captures the input from game peripherals.
// Everywhere an object requires input, this script will
// need to run to capture it.

/*
	Controls
	- Attack [Shoot, Slash] (Press, Hold)
	- Jump [Jump higher]
	- Dash
	- Move [Left, Right]
	- Crouch [Down]
	- Action [Up]
	- Special [Weapons from bosses]
	- Weapon Switch [Toggle Weapons]
	- Unique Attack [Use character special move]
	- Pause [Main Menu]
	
*/

// TODO: We'll want to get what we're using as input.


//var gp_num = gamepad_get_device_count();
//for (var i = 0; i < gp_num; i++;) {
//	if (gamepad_is_connected(i)) 
//		show_debug_message("This is the slot: " + string(i));
// } 


input_right = keyboard_check(vk_right) || gamepad_button_check(4, gp_padr);
input_left = keyboard_check(vk_left) || gamepad_button_check(4, gp_padl);
input_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(4, gp_face1); // Check if the jump botton has been tapped/pressed.
input_jump_held = keyboard_check(vk_space) || gamepad_button_check(4, gp_face1); // Check if the jump button is being held down.
input_attack = keyboard_check_released(ord("Z")) || gamepad_button_check_released(4, gp_face3);
input_attack_held = keyboard_check(ord("Z")) || gamepad_button_check(4, gp_face3);
input_dash = keyboard_check(vk_shift) || gamepad_button_check(4, gp_face2);
input_dash_held = keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(4, gp_face2);
