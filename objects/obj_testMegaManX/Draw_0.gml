/// @description Insert description here
// You can write your code in this editor



switch (equipped) {
	case 0:
		shader_reset();
		draw_self();
		break;
	case 1:
		draw_self();
		shader_set(sh_weapon1);
		draw_self();
		shader_reset();
		break;
	case 2:
		draw_self();
		shader_set(sh_weapon2);
		draw_self();
		shader_reset();
		break;
	case 3:
		draw_self();
		shader_set(sh_weapon3);
		draw_self();
		shader_reset();
		break;
	case 4:
		draw_self();
		shader_set(sh_weapon4);
		draw_self();
		shader_reset();
		break;
}