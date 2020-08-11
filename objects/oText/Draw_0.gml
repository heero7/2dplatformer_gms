/// @description Insert description here
// You can write your code in this editor


// Draw the box
var halfw = w / 2;
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(
	x - halfw - border, y - h - (border * 2), x + halfw + border, y,
	15, 15, false
);

// Draw the triangle
draw_sprite(sDialogueMarker, 0, x, y);
draw_set_alpha(1);

// Draw the text
DrawSetText(c_white, fMenu, fa_center, fa_top); // Set from a script
draw_text(x , y - h - border, text_current);
