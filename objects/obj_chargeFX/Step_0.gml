/// @description Insert description here
// You can write your code in this editor
draw_self();
if (obj_testMegaManXBuster.holdFireAmount >= 15
	&& obj_testMegaManXBuster.holdFireAmount <= 99) {
	if (image_index > 4) {
		image_index = 0;
	}
	image_alpha = 0.6;
} else if (obj_testMegaManXBuster.holdFireAmount >= 100) {
	if (image_index == 0) {
		image_index = 5;
	}
	image_alpha = 0.6;
}
else image_alpha = 0;

x = obj_testMegaManXBuster.x;
y = obj_testMegaManXBuster.y;
