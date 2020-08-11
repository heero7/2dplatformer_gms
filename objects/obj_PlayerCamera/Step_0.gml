/// @description Update camera

// Update the destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

// Update object position
x += (xTo - x) / 15;
y += (yTo - y) / 15;

x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

// Screen shaking
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));


// Update camera view
camera_set_view_pos(playerCam, x - view_w_half, y - view_h_half);


// Paralax
// TODO: This is really bad to do. Finda way to cache this
if (layer_exists("Mountains")) {
	layer_x("Mountains", x / 3);
}