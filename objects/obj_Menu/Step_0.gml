/// @description Control Menu
// Item eas in.

menu_x += (menu_x_target - menu_x) / menu_speed;

// Keyboard control
if (menu_control) {
	if (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(4, gp_padu)) {
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(4, gp_padd)) {
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	
		
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(4, gp_face1)) {
		menu_x_target = gui_width + 200;
		menu_committed = menu_cursor;
		menu_control = false;
	}
}



if (menu_x > gui_width + 150 && menu_committed!= -1) {
	switch (menu_committed) {
		case 2:
		default:
			SlideTransition(TRANSITION_MODE.NEXT);
			break;
		case 1:
		{
			if (!file_exists(SAVEFILE)) SlideTransition(TRANSITION_MODE.NEXT);
			else {
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				file_text_close(file);
				SlideTransition(TRANSITION_MODE.GOTO, target);
			}
			break;
		}
		case 0:
			game_end();
			break;
	}
}