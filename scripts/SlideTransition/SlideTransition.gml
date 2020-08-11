/// @desc SlideTransition(mode, targetRoom)
/// @arg mode TransitionMode state
/// @arg targetRoom room destination 

with (obj_transition) {
	mode = argument[0];
	if (argument_count > 1) target = argument[1];
}