/// @desc ??

// Colour Switch
var _subimg = 0;
switch (colour) {
		
	case "Black":
		_subimg = 1;
		break;
	case "White":
		_subimg = 0;
		break;
	case "Cyan":
		_subimg = 2;
		break;
	case "Magenta":
		_subimg = 3;
		break;
	case "Yellow":
		_subimg = 4;
		break;
	case "Red":
		_subimg = 5;
		break;
	case "Green":
		_subimg = 6;
		break;
	case "Blue":
		_subimg = 7;
		break;
		
}

// Draw Outline
if (is_function) {
	draw_sprite(sFunction, 0,  grid_coords[0] *120, (grid_coords[1] - distance_up) * 120);
	for (var _i = 1; _i <= distance_down + distance_up - 1; _i++) {
	
		draw_sprite(sFunction, 1, grid_coords[0] * 120, (grid_coords[1] - distance_up + _i) * 120);
	
	}
	draw_sprite(sFunction, 2, (grid_coords[0] * 120), (grid_coords[1] + distance_down) *120)
}

draw_sprite(sBlock, _subimg, x, y)