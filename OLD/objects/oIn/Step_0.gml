/// @desc ??

if (global.pass_turn && global.input_trigger == 0) {
	
	if (!position_meeting(x, y, oBlock)) {
		
		instance_create_layer(x, y, "Instances", oBlock);
		
	}
	
}

// spawn shit
if (spawn_block_colour != "") {
	
	var _e = instance_create_layer(x, y, "Instances", oBlock);
	_e.force_colour = spawn_block_colour;
	_e.spawned_at = id;
	
	spawn_block_colour = ""
	
}

// kill if off grid (in inventory)
if (grid_coords[1] > 6) {
	instance_destroy();
}
// kill if on the same space as another one of me
for (var _i = 0; _i < instance_number(oIn); _i++) {
	var _e = instance_find(oIn, _i);
	if (_e.id != id && _e.x == x && _e.y == y) {
		instance_destroy();
	}
}
// Kill if on the same space as an output
for (var _i = 0; _i < instance_number(oOut); _i++) {
	var _e = instance_find(oOut, _i);
	if (_e.x == x && _e.y == y) {
		instance_destroy(_e);
	}
}

x = grid_coords[0] * 120;
y = grid_coords[1] * 120;