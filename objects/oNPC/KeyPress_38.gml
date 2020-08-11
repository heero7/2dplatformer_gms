/// @description Insert description here
// You can write your code in this editor

show_debug_message("Pressed");

if (point_in_circle(obj_PlayerController.x, obj_PlayerController.y, x,y, 64) && !instance_exists(oText)) {
	with (instance_create_layer(x, y - 64, layer, oText)) {
		text = other.text
		length = string_length(text);
	}
	
	with (obj_PlayerCamera) {
		follow = other.id;
	}
}