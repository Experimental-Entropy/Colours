/// @desc ??

draw_set_colour(c_gray);
//draw_rectangle(0, 7*120, room_width, room_height, false);
draw_set_colour(c_white);
if (global.won) {
	draw_sprite(sWin, 0, room_width/2 - sprite_get_width(sWin)/2, room_height/2 - sprite_get_height(sWin));
}