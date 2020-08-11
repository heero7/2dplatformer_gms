/// @description Handle switching to explosion animation.
if (healthPoints <= 0) {
	instance_create_layer(x, y, layer, obj_test_mettaurDead);
	
	instance_destroy();
}
