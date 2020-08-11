/// @description Initialization

w = display_get_gui_width(); // Width of th GUI.
h = display_get_gui_height(); // Height of the GUI
h_half = h / 2;

enum TRANSITION_MODE {
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

mode = TRANSITION_MODE.INTRO;
percent = 1;
target = room;