/// @description Constructor
isGrounded = false;
touchingWall = 0;

vsp_max = 10; // This is the maximum amount we are going to apply in force above the player
hsp_wjump = 4; // This is the horizontal distance we send the player when jumping off a wall.
vsp_wjump = -5; // This is the vertical distance we send the player when jumping off a wall.
vsp_max_wall = 1; // This is the maximum speed we will apply when sliding on a wall.

grv_wall = 0.05; // Gravity application when sliding on a wall.

wallJumpDelay = 0; // Counts the frames to allow input between wall jumps.
wallJumpDelay_max = 5; // The amount of delay between wall jumps.

isDashing = false;
dashCoolDown = 0;
dashCoolDown_max = 10;
dashButtonReleased = true;

hasControl = true;
canJump = 0; // Time allowed to see if we can jump.

enum PLAYERSTATE {
	IDLE,
	WALLSLIDING,
	FREE,
	DASHING,
}
