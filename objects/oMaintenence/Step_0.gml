/// @desc pass turn - victory

// global.pass_turn = false;

if (mouse_check_button_pressed(mb_right) && global.input_trigger <= 0) 
{
	
	global.pass_turn = true;
	global.input_trigger = input_trigger_max;
	
}


/// INITIATE PHASES SYSTEM

global.phase_conveyor = false;
global.phase_function = false;
global.phase_inout = false;

if (global.input_trigger == input_trigger_bound_conveyor) 
{
	
	global.phase_conveyor = true;
	
}

if (global.input_trigger == input_trigger_bound_function)
{
	
	global.phase_function = true;
	
}

if (global.input_trigger == input_trigger_bound_inout)
{
	
	global.phase_inout = true;
	
}


// Stop player right clicking during turn passing process

if (global.pass_turn && global.input_trigger > 0) 
{
	
	global.input_trigger -= 1
	
}

if (global.pass_turn && global.input_trigger <= 0)
{
	
	global.pass_turn = false;

}


/*
for (var _i = 0; _i < instance_number(oBlock); _i++) {
	
	var _e = instance_find(oBlock, _i);
	if (_e.colour == "Cyan") {
		
		var _b = 0;
		for (var _n = 0; _n < instance_number(oBlock); _n++) {
			
			var _o = instance_find(oBlock, _n);
			
			if (_o.colour == "Magenta" && _o.grid_coords[0] == _e.grid_coords[0] && _o.grid_coords[1] == _e.grid_coords[1] + 1) {
				_b += 1;
			}
			
			if (_o.colour == "Yellow" && _o.grid_coords[0] == _e.grid_coords[0] && _o.grid_coords[1] == _e.grid_coords[1] + 2) {
				_b += 1;
			}
			
			if (_o.colour == "White" && _o.grid_coords[0] == _e.grid_coords[0] + 1 && _o.grid_coords[1] == _e.grid_coords[1]) {
				_b += 1;
			}
			
			if (_o.colour == "Black" && _o.grid_coords[0] == _e.grid_coords[0] + 1 && _o.grid_coords[1] == _e.grid_coords[1] + 2) {
				_b += 1;
			}
			
			if (_o.colour == "Red" && _o.grid_coords[0] == _e.grid_coords[0] + 2 && _o.grid_coords[1] == _e.grid_coords[1]) {
				_b += 1;
			}
			
			if (_o.colour == "Blue" && _o.grid_coords[0] == _e.grid_coords[0] + 2 && _o.grid_coords[1] == _e.grid_coords[1] + 1) {
				_b += 1;
			}
			
			if (_o.colour == "Green" && _o.grid_coords[0] == _e.grid_coords[0] + 2 && _o.grid_coords[1] == _e.grid_coords[1] + 2) {
				_b += 1;
			}
			
			
		}
		
		if (_b == 7) {
			
			// VICTORY!!
			show_debug_message("You won!");
			global.won = true;
			
		}
		
		
	}
	
}*/

// how leave level?

if (keyboard_check_pressed(vk_enter)) {
	
	room_goto(rLevelSelect);
	
}