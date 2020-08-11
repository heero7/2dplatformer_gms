/// @description Enemy Controller

/// @description Enemy Code

verticalSpeed += enemyGrv;
isGrounded = place_meeting(x, y + 1, obj_wall);
movingDirection = facingDir;

// Vertical Movement.
// Note: A negative value means we're in the air.

// About to walk off the ledge
if (isGrounded && afraidOfHeights && !place_meeting(x + horizontalSpeed, y + 1, obj_wall)) {
	horizontalSpeed = -horizontalSpeed;
}

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
	horizontalSpeed = -horizontalSpeed; // Head the other direction.
	image_xscale = sign(horizontalSpeed) * -1;
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

