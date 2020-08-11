/// @description Keep sprite on collision.
/**
	This makes sure that we're drawing the bullet
	before we get rid of it. You would see the 
	bullet disappear before the bullet touches
	the object. (If done in Step event). Can 
	do this. 
	
	TODO: This might make more sense in the Step
	event if we want to show the bullet collision
	FX.
*/
if (place_meeting(x, y, obj_wall)) {
	instance_destroy();
}
