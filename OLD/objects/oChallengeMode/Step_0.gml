/// @desc ??

if (keyboard_check_pressed(ord("Y"))) {
	
	global.challenge_mode = true;
	instance_destroy();
	
} else if (keyboard_check_pressed(ord("N"))) {
	
	global.challenge_mode = false;
	instance_destroy();
	
}