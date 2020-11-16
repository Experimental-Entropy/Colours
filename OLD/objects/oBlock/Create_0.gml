/// @desc set up vars

//if (!variable_instance_exists(id, "colour")) {
	colour = "White"
//} else {
//	

	
//}

// colour transfer

grid_coords = [x div 120, y div 120]
old_grid = [x div 120, y div 120]

move_right = false;
move_left = false;
move_up = false;
move_down = false;

distance_up = 0;
distance_down = 0;
is_function = false;

if (!variable_instance_exists(id, "spawned_at")) {
	spawned_at = 0;
	if (position_meeting(x, y, oIn)) {spawned_at = instance_place(x, y, oIn)}
}

depth = -10

grid_coords_predicted = grid_coords;
predicted_move_into_out = false;

can_move = false;