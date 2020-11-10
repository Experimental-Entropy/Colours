/// @desc ??

// Block Collection
if (global.phase_inout)
{
	
	if (position_meeting(x,y, oBlock)) {
	
		var _e = instance_place(x, y, oBlock);
		if (_e.spawned_at != 0) {
			if (instance_exists(_e.spawned_at)) {
			
				var _spawn_colour = ""
				switch (_e.colour) {
				
					case "White":
						_spawn_colour = "Black";
						break;
					case "Black":
						_spawn_colour = "White";
						break;
					case "Cyan":
						_spawn_colour = "Red";
						break;
					case "Magenta":
						_spawn_colour = "Green";
						break;
					case "Yellow":
						_spawn_colour = "Blue";
						break;
					case "Blue":
						_spawn_colour = "Yellow";
						break;
					case "Green":
						_spawn_colour = "Magenta";
						break;
					case "Red":
						_spawn_colour = "Cyan";
						break;
				
				
				
				}
			
				_e.spawned_at.spawn_block_colour = _spawn_colour;
				instance_destroy(_e);
			
			}
		}
	
	}
	
}

// kill if off grid (in inventory)
if (grid_coords[1] > 6) 
{
	instance_destroy();
}
// kill if on the same space as another one of me
for (var _i = 0; _i < instance_number(oOut); _i++) 
{
	var _e = instance_find(oOut, _i);
	if (_e.id != id && _e.x == x && _e.y == y) 
	{
		instance_destroy();
	}
}

x = grid_coords[0] * 120;
y = grid_coords[1] * 120;