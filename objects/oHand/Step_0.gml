/// @desc drag & drop

global.just_placed_an_in = false;

// place
if (mouse_check_button_pressed(mb_left)) {
	
	//if (position_meeting(mouse_x, mouse_y, id)) {
		
		if (mouse_y > room_height - 240 && clicked) {
			
			clicked = false;
			
		}
		
		if (clicked && sprite_baby_is != sDestroy) {
			
			var _o = instance_create_layer(mouse_x div 120 * 120, mouse_y div 120 * 120, "Instances", object_baby_is);
			_o.direction = direction;
			if (sprite_baby_is == sIn)
			{
				alarm[0] = 2;
			}
			//clicked  = false;
			
		} else {
			
			if (sprite_baby_is == sDestroy && clicked) {
				
				if (!global.challenge_mode) {
				
					var _mouse_grid = [mouse_x div 120, mouse_y div 120];
					for (var _i = 0; _i < instance_number(oDestructable); _i++) 
					{
						var _e = instance_find(oDestructable, _i);
						if (_e.grid_coords[0] == _mouse_grid[0] && _e.grid_coords[1] == _mouse_grid[1]) 
						{
							instance_destroy(_e);
							break;
						}
					}
					//clicked = false;
				
				} else {
					
					var _mouse_grid = [mouse_x div 120, mouse_y div 120];
					for (var _i = 0; _i < instance_number(oIn); _i++) {
						var _e = instance_find(oIn, _i);
						if (_e.grid_coords[0] == _mouse_grid[0] && _e.grid_coords[1] == _mouse_grid[1]) {
							instance_destroy(_e);
							break;
						}
					}
					for (var _i = 0; _i < instance_number(oOut); _i++) {
						var _e = instance_find(oOut, _i);
						if (_e.grid_coords[0] == _mouse_grid[0] && _e.grid_coords[1] == _mouse_grid[1]) {
							instance_destroy(_e);
							break;
						}
					}
					
					for (var _i = 0; _i < instance_number(oConveyor); _i++) {
						
						var _e = instance_find(oConveyor, _i);
						if (_e.unused == true) {
							if (_e.grid_coords[0] == _mouse_grid[0] && _e.grid_coords[1] == _mouse_grid[1]) {
								
								instance_destroy(_e);
								break;
							
							}
						}
						
					}
					
					//clicked = false;
					
				}
				
			}
			
		}
		
		
	//}
	
}


// pick up
if (mouse_check_button_pressed(mb_left)) {
	
	if (position_meeting(mouse_x, mouse_y, id)) {
		
		clicked = true;
		
	}
	
}
if (keyboard_check_pressed(ord(string(number)))) {
	
	clicked = true;
	
}

if (keyboard_check_pressed(ord("1")) && number != 1) {
	clicked = false;
}
if (keyboard_check_pressed(ord("2")) && number != 2) {
	clicked = false;
}
if (keyboard_check_pressed(ord("3")) && number != 3) {
	clicked = false;
}
if (keyboard_check_pressed(ord("0")) && number != 0) {
	clicked = false;
}


if (clicked) {
	
	if (mouse_wheel_down() || keyboard_check_pressed(ord("E"))) {
		
		if (direction > 0) {direction -= 1} 
		else if (direction == 0) {direction = 3}
		
	}
	
	if (mouse_wheel_up() || keyboard_check_pressed(ord("Q"))) {
		
		if (direction < 3) {direction += 1} 
		else if (direction == 3) {direction = 0}
		
	}
	
}

// release
if (keyboard_check_pressed(vk_escape)) {
	
	clicked = false;
	
}

