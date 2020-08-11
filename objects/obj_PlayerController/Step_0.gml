/// @description Base Player Controller.
// You can write your code in this editor

// TODO: Check for Gamepad

// Check input.
// Get input from keyboard.
if (hasControl) {
	scr_player_input();
} else {
	input_right = 0;
	input_left = 0;
	input_jump = 0; // Check if the jump botton has been tapped/pressed.
	input_jump_held = 0; // Check if the jump button is being held down.
	input_attack = 0;
	input_attack_held = 0;
	input_dash = 0;
	input_dash_held = 0;
}

#region Movement
// Subtract the two input directions to get the direction the player
// is moving. 
// 0 : Neutral
// 1 : Moving to the right
// -1 :Moving to the left

// Calculate horizontal movement
//if (input_dash_held) {
//	dashTimer = room_speed * 0.75;
//}


wallJumpDelay = max(wallJumpDelay - 1, 0);
dashCoolDown = max(dashCoolDown - 1, 0);

if (wallJumpDelay == 0) {
	movingDirection = input_right - input_left;
	horizontalSpeed = movingDirection * walkSpeed; // Calulate the amount we want to move in the horizontal direction.	
}

// Dashing
//if (input_dash) {
//	dashCoolDown = dashCoolDown_max;
//	alarm[0] = 10;
//}

if (keyboard_check_released(vk_shift)) dashButtonReleased = true;

// Wall Jump
if (touchingWall != 0 && !isGrounded && input_jump) {
	wallJumpDelay = wallJumpDelay_max;
	horizontalSpeed = -touchingWall * hsp_wjump;
	verticalSpeed = vsp_wjump;
}

// Calculate vertical movement
var grv_final = playerGrv;
var vsp_max_final = vsp_max;
if (touchingWall != 0 && verticalSpeed > 0 && movingDirection == touchingWall) {
	grv_final = grv_wall;
	vsp_max_final = vsp_max_wall;
}

verticalSpeed += grv_final;
verticalSpeed = clamp(verticalSpeed, -vsp_max_final, vsp_max_final);

// Ground Jump
canJump -= 1;
if (canJump > 0 && input_jump) {
	verticalSpeed = jumpHeight;
	canJump = 0;
}
// If the player didn't hold the jump button
// to jump higher.
if (verticalSpeed < 0 && !input_jump_held) {
	verticalSpeed = max(jumpHeight, -jumpHeight / hopDivisor);
}

#endregion

#region Collisions
// Check for Horizontal Collisions.
// Check to see if there is a collision, ahead of the
// object + [horizontalSpeed] distance.
if (place_meeting(x + horizontalSpeed, y, obj_wall)) {
	// Move as close as we can.
	// Check in the direction we're facing, by checking the sign of the 
	// Horizontal Speed.
	while (!place_meeting(x + sign(horizontalSpeed), y, obj_wall)) {
		x += sign(horizontalSpeed); // Add each frame 1 pixel
	}
	horizontalSpeed = 0; // Stop speed to halt.
}

x += horizontalSpeed; // Add the calucalted horizontal movement to this object's X coordinate.

// Check for Vertical Collisions.
// Check to see if there is a collision, above of the
// object + [verticalSpeed] distance.
if (place_meeting(x, y + verticalSpeed, obj_wall)) {
	// Move as close as we can.
	// Check in the direction we're facing, by checking the sign of the 
	// Vertical Speed.
	while (!place_meeting(x, y + verticalSpeed, obj_wall)) {
		y += sign(verticalSpeed); // Add each frame 1 pixel
	}
	verticalSpeed = 0; // Stop speed to halt.
}

y += verticalSpeed; // Add the calucalted horizontal movement to this object's X coordinate.
#endregion

isGrounded = place_meeting(x, y + 1, obj_wall);
touchingWall = place_meeting(x + 1, y, obj_wall) - place_meeting(x - 1, y, obj_wall);
if (isGrounded) canJump = 10;

#region Animations / Sprite handling

if (horizontalSpeed != 0  && movingDirection != 0) {
	image_xscale = facingDir; // Flip the direction of the sprite.
	if (sign(movingDirection) != facingDir) {
		facingDir = facingDir * -1;	
	}
}

if (touchingWall != 0 && verticalSpeed > 0 && movingDirection == touchingWall) {
	// The sprite needs to face opposite the wall.
	// Flip the image.
	image_xscale = -touchingWall;
	facingDir *= -1;
}


#endregion 

