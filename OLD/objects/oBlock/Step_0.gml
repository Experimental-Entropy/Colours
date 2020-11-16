/// @desc many things

// Collision in potentia protection
if (grid_coords_predicted != grid_coords && predicted_move_into_out == false)
{
	// show_debug_message("Checking for potential collisions...")
	can_move = true;
	for (var _i = 0; _i < instance_number(oBlock); _i++)
	{
		var _e = instance_find(oBlock, _i);
		
		if (_e.grid_coords_predicted[0] == grid_coords_predicted[0] && _e.grid_coords_predicted[1] == grid_coords_predicted[1] && _e.predicted_move_into_out == false && _e.id != id)
		{
			can_move = false;
			// show_debug_message("Predicted collision")
		}
	}
}

//grid_coords_predicted = grid_coords;

// Move signal applied by conveyors. 
if (move_right) {
	
	//if (!position_meeting((grid_coords[0] + 1) * 120, (grid_coords[1]) * 120, oBlock)) {
		alarm[3] = 2;
		grid_coords_predicted[0] += 1;
		predicted_move_into_out = false;
		for (var _i = 0; _i < instance_number(oOut); _i++)
		{
			var _e = instance_number(oOut);
			if (_e.grid_coords[0] == grid_coords_predicted[0] && _e.grid_coords[1] == grid_coords_predicted[1])
			{
				predicted_move_into_out = true;
			}
		}
	//}
	
	move_right = false;
	
}
if (move_left) {
	
	//if (!position_meeting((grid_coords[0] - 1) * 120, (grid_coords[1]) * 120, oBlock)) {
		alarm[2] = 2;
		grid_coords_predicted[0] -= 1;
		predicted_move_into_out = false;
		for (var _i = 0; _i < instance_number(oOut); _i++)
		{
			var _e = instance_number(oOut);
			if (_e.grid_coords == grid_coords_predicted)
			{
				predicted_move_into_out = true;
			}
		}
	//}
	
	move_left = false;
	
}
if (move_down) {
	
	//if (!position_meeting((grid_coords[0]) * 120, (grid_coords[1] + 1) * 120, oBlock)) {
		alarm[1] = 2;
		grid_coords_predicted[1] +=  1;
		predicted_move_into_out = false;
		for (var _i = 0; _i < instance_number(oOut); _i++)
		{
			var _e = instance_number(oOut);
			if (_e.grid_coords == grid_coords_predicted)
			{
				predicted_move_into_out = true;
			}
		}
	//}
	
	move_down = false;
	
}
if (move_up) {
	
	//if (!position_meeting((grid_coords[0]) * 120, (grid_coords[1] - 1) * 120, oBlock)) {
		alarm[0] = 2;
		grid_coords_predicted[1] -= 1;
		predicted_move_into_out = false;
		for (var _i = 0; _i < instance_number(oOut); _i++)
		{
			var _e = instance_number(oOut);
			if (_e.grid_coords == grid_coords_predicted)
			{
				predicted_move_into_out = true;
			}
		}
	//}
	
	move_up = false;
	
}

// Colour force
if (variable_instance_exists(id, "force_colour")) {
	colour = force_colour
}

// kill if off grid (in inventory)
if (grid_coords[1] > 6) {
	instance_destroy();
}
// kill if on the same space as another one of me
for (var _i = 0; _i < instance_number(oBlock); _i++) {
	var _e = instance_find(oBlock, _i);
	if (_e.id != id && _e.x == x && _e.y == y) {
		instance_destroy();
	}
}


// Block Functions
is_function = false;
below_conveyor = false;
for (var _i = 0; _i < instance_number(oConveyor); _i++) {
	
	var _e = instance_find(oConveyor, _i);
	if (_e.grid_coords[0] == grid_coords[0] && _e.grid_coords[1] == grid_coords[1] - 1) {
		below_conveyor = true;
	}
	
}


distance_up = 0;
distance_down = 0;

if (below_conveyor) {
	
	// INITIATE FUNCTIONING
	var _b = false;
	var _colours = [];
	var _remove = false;
	
	
	for (var _i = 0; _i < instance_number(oBlock); _i++) {
		
		var _e = instance_find(oBlock, _i);
		if (_e.grid_coords[0] == grid_coords[0] && _e.grid_coords[1] == grid_coords[1] + 1) {
			if (_e.colour == "Black") {
				_remove = true;
				distance_down = 1;
			}
		}
		
	}
	for (var _i = 0; _i < instance_number(oBlock); _i++) {
		var _e = instance_find(oBlock, _i);
		if (_e.grid_coords[0] == grid_coords[0] && _e.grid_coords[1] == grid_coords[1] - 2) {
			// Am I primary?
			if (colour == "Cyan" || colour == "Magenta" || colour == "Yellow") {
				_b = true;
				_colours[array_length_1d(_colours) + 1] = _e.colour
				distance_up = 2;
			}
		}
	}
	
	var _c = false;
	for (var _i = 0; _i < instance_number(oConveyor); _i++) {
		var _e = instance_find(oConveyor, _i);
		if (_e.grid_coords[0] == grid_coords[0] && _e.grid_coords[1] == grid_coords[1] - 1) {
			_c = true;
		}
	}
	
	if (_b && _c) {
		
		is_function = true;
			
		if (global.phase_function || global.just_placed_an_in)
		{
		
			var _b2 = false;
			for (var _i = 0; _i < instance_number(oBlock); _i++) {
				var _e = instance_find(oBlock, _i)
				if (_e.grid_coords[0] == grid_coords[0] && _e.grid_coords[1] == grid_coords[1] - 3) {
					if (true) {
						_b2 = true;
						_colours[array_length_1d(_colours) + 1] = _e.colour;
						distance_up = 3;
					}
				}
			}
			var _b3 = false;
			if (_b2) {
				for (var _i = 0; _i < instance_number(oBlock); _i++) {
					var _e = instance_find(oBlock, _i)
					if (_e.grid_coords[0] == grid_coords[0] && _e.grid_coords[1] == grid_coords[1] - 4) {
						if (true) {
							_b3 = true;
							_colours[array_length_1d(_colours) + 1] = _e.colour;
							distance_up = 4;
						}
					}
				}
			}
			var _b4 = false;
			if (_b3) {
				for (var _i = 0; _i < instance_number(oBlock); _i++) {
					var _e = instance_find(oBlock, _i)
					if (_e.grid_coords[0] == grid_coords[0] && _e.grid_coords[1] == grid_coords[1] - 5) {
						if (true) {
							_b4 = true;
							_colours[array_length_1d(_colours) + 1] = _e.colour;
							distance_up = 5;
						}
					}
				}
			}
			if (_b4) {
				for (var _i = 0; _i < instance_number(oBlock); _i++) {
					var _e = instance_find(oBlock, _i)
					if (_e.grid_coords[0] == grid_coords[0] && _e.grid_coords[1] == grid_coords[1] - 6) {
						if (/*_e.colour == "Cyan" || _e.colour == "Magenta" || _e.colour == "Yellow" || _e.colour == "White" || _e.colour == "Black" || _remove*/true) {
							_b4 = true;
							_colours[array_length_1d(_colours) + 1] = _e.colour;
							distance_up = 6;
						}
					}
				}
			}
		
			for (var _i = 0; _i < instance_number(oBlock); _i++) {
			
				var _e = instance_find(oBlock, _i);
				if (_e.grid_coords[0] == grid_coords[0] && _e.grid_coords[1] == grid_coords[1] - 1) {
				
					// Apply function
					if (!_remove) {
					
						var _CinC = false;
						for (var _n = 0; _n < array_length_1d(_colours); _n++) {
							if (_e.colour == _colours[_n]) {_CinC = true}
						}
					
						if (_CinC) {
					
							switch (colour) {
						
								case "Cyan":
									switch (_e.colour) {
									
										case "Cyan":
											_e.force_colour = "Cyan";
											break;
									
										case "Magenta":
											_e.force_colour = "Blue";
											break;
									
										case "Yellow":
											_e.force_colour = "Green";
											break;
										
										case "White":
											_e.force_colour = colour;
											break;
									
										case "Red":
											_e.force_colour = "Black";
											break;
									
									}
									break;
								
								case "Yellow":
									switch (_e.colour) {
									
										case "Yellow":
											_e.force_colour = "Yellow";
											break;
									
										case "Magenta":
											_e.force_colour = "Red";
											break;
									
										case "Cyan":
											_e.force_colour = "Green";
											break;
										
										case "White":
											_e.force_colour = colour;
											break;
										
										case "Blue":
											_e.force_colour = "Black";
											break;
									
									}
									break;
							
								case "Magenta":
									switch (_e.colour) {
									
										case "Yellow":
											_e.force_colour = "Red";
											break;
									
										case "Cyan":
											_e.force_colour = "Blue";
											break;
										
										case "White":
											_e.force_colour = colour;
											break;
										
										case "Green":
											_e.force_colour = "Black";
											break;
									
									}
									break;
						
							}
						}
					
					} else {
					
						var _CinC = false;
						for (var _n = 0; _n < array_length_1d(_colours); _n++) {
							if (_e.colour == _colours[_n]) {_CinC = true}
						}
					
						if (_CinC) {
					
							switch (colour) {
						
								case "Cyan":
									switch (_e.colour) {
									
										case "Blue":
											_e.force_colour = "Magenta";
											break;
									
										case "Green":
											_e.force_colour = "Yellow";
											break;
										
										case "Black":
											_e.force_colour = "Red";
											break;
									
										case "Cyan":
											_e.force_colour = "White";
											break;
									
									}
								
								case "Yellow":
									switch (_e.colour) {
									
										case "Green":
											_e.force_colour = "Cyan";
											break;
									
										case "Red":
											_e.force_colour = "Magenta";
											break;
										
										case "Black":
											_e.force_colour = "Blue";
											break;
										
										case "Yellow":
											_e.force_colour = "White";
											break;
									
									}
							
								case "Magenta":
									switch (_e.colour) {
									
										case "Blue":
											_e.force_colour = "Cyan";
											break;
									
										case "Red":
											_e.force_colour = "Yellow";
											break;
										
										case "Black":
											_e.force_colour = "Green";
											break;
									
										case "Magenta":
											_e.force_colour = "White";
											break;
										
									}
							}
						}
					}
				}
			}
		}
	}
}


x = grid_coords[0] * 120
y = grid_coords[1] * 120