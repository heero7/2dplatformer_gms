/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (keyboard_check_pressed(ord("A"))) {
	equipped++;
	if (equipped >= weaponsLen) equipped = 0;
	show_debug_message("Weapon index equipped: " + string(equipped));
}

if (keyboard_check_pressed(ord("S"))) {
	equipped--;
	if (equipped < 0) equipped = weaponsLen - 1;
	show_debug_message("Weapon index equipped: " + string(equipped));
}

