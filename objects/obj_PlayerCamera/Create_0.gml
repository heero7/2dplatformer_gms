/// @description Camera initialization
playerCam = view_camera[0];
follow = obj_PlayerController;
view_w_half = camera_get_view_width(playerCam) / 2;
view_h_half = camera_get_view_height(playerCam) / 2;
xTo = xstart;
yTo = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;