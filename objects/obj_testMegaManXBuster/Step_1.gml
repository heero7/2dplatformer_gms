/// @description Insert description here
// You can write your code in this editor
scr_player_input();

// TODO: Maybe check for the instance.. if it exists.


var movingInADirection = obj_testMegaManX.horizontalSpeed != 0;
var slidingAndTouchingAWall = (obj_testMegaManX.touchingWall != 0 && obj_testMegaManX.verticalSpeed > 0 
		&& obj_testMegaManX.movingDirection == obj_testMegaManX.touchingWall);

// Flip the location of the sprite.
if (movingInADirection || slidingAndTouchingAWall) {
	if (movingInADirection) image_xscale = sign(obj_testMegaManX.horizontalSpeed);
	else if (slidingAndTouchingAWall) image_xscale = -obj_testMegaManX.touchingWall;
	x = obj_testMegaManX.x + (20 * image_xscale);
}


y = obj_testMegaManX.y;

// Can only shoot at certain frames. Preventing
// multiple bullets all at once. So we'll decrement
// this value until we hit the number we want.
// TODO: Set this as a variable to parent object.
// TODO: Create a variable that sets the firingRate to wait for
// Note: The lower the number, the less they will be able to shoot
firingDelay -= 1;
recoil = max(0, recoil - 1);

if (input_attack_held == 1) {
	holdFireAmount += 1;
	if (holdFireAmount > 100) {
		level = 3;
	} else if (holdFireAmount > 15) {
		level = 2;
	} else {
		level = 1;
	}
}

if (input_attack) {
	holdFireAmount = 0;
}

if (input_attack && firingDelay < -3) {
	recoil = 4;
	firingDelay = 5;
	var bullet = obj_bullet01;
	if (level == 2) bullet = obj_bullet02;
	if (level == 3) {
		bullet = obj_bullet03;
		recoil *= 5;
	}
	with(instance_create_layer(x, y, "Bullets", bullet)) {
		speed = 25 * obj_testMegaManX.facingDir;
		direction = obj_testMegaManX.facingDir;
		image_xscale = obj_testMegaManX.facingDir;
	}
	// Apply recoil to the player.
	// TODO: After applying recoil add some delay where they cannot move.
	// TODO: Bug found.. if you move the OTHER object.. you'll move through objects!
	// Create a script that performs this anytime you want to move an object.
	//with(obj_testMegaManX) {
	//	x = x - lengthdir_x(other.recoil, image_angle) * facingDir;
	//	other.x = other.x - lengthdir_x(other.recoil, image_angle) * facingDir;
	//}
	level = 1;
}

