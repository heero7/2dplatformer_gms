/// @description Location Controller

var player = obj_testMegaManX;
if (instance_exists(player))
{
	if (lock_x) x = player.x;
	else x = x_cord;
	
	if (lock_y) y = player.y;
	else y = y_cord;
}
