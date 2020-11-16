/// @desc clickeroneyated

if (mouse_check_button_pressed(mb_left)) {
	
	if (position_meeting(mouse_x, mouse_y, id)) {
		
		switch (levelno) {
			
			case 1:
				room_goto(rLv1);
				break;
			
		}
		
	}
	
}