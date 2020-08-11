/// @description Move to next room
with (obj_PlayerController) {
	if (hasControl) {
		hasControl = false;
		SlideTransition(TRANSITION_MODE.GOTO, other.target);
	}	
}
