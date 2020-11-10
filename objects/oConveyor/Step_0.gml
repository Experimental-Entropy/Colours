/// @desc Move block on pass turn and direction

if (global.phase_conveyor && global.pass_turn) {
	
	var _e = 0
	for (var _i = 0; _i < instance_number(oBlock); _i++) {
		_e = instance_find(oBlock, _i);
		// show_debug_message(grid_coords)
		// show_debug_message(_e.grid_coords)
		if (_e.grid_coords[0] == grid_coords[0] && _e.grid_coords[1] == grid_coords[1]) {
			
			if (direction == 0) {
				_e.move_right = true;
			}
			if (direction == 2) {
				_e.move_left = true;
			}
			if (direction == 1) {
				_e.move_up = true;
			}
			if (direction == 3) {
				_e.move_down = true;
			}
			unused = false;
			
		}
	}
	
}

// kill if off grid (in inventory)
if (grid_coords[1] > 6) {
	instance_destroy();
}
// kill if on the same space as another one of me
for (var _i = 0; _i < instance_number(oConveyor); _i++) {
	var _e = instance_find(oConveyor, _i);
	if (_e.id != id && _e.x == x && _e.y == y) {
		if (!global.challenge_mode || (global.challenge_mode && unused)) {
			instance_destroy();
		} else {
			instance_destroy(_e);
		}
	}
}

image_angle = direction * 90;

x = grid_coords[0] * 120;
y = grid_coords[1] * 120;