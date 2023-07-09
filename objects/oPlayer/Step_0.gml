/// @description Runs once per frame, movement for player


//KEY DECLARATIONS
p1key_right = keyboard_check(ord("D"));
p1key_left = keyboard_check(ord("A"));
p1key_up = keyboard_check(ord("W"));
p1key_down = keyboard_check(ord("S"));
//leftmouse_down = mouse_check_button_pressed(mb_left);

//HORIZONTAL MOVEMENT
if (p1key_right or p1key_left)
	{
		p1hsp = (p1key_right - p1key_left) * p1hsp_walk;
		
		if(p1key_right)
		{
			image_xscale = 1
		}
		if(p1key_left)
		{
			image_xscale = -1;
		}
	}
	else{
		
		p1hsp = 0
		
	}
	
	
	//VERTICAL MOVEMENT
	
	if (p1key_up or p1key_down)
	{
		p1vsp = (p1key_up - p1key_down) * p1hsp_walk;
		
	}
	else{
		
		p1vsp = 0;
		
	}

	//CHECK FOR HORIZONTAL COLLISIONS

	var onepixel = sign(p1hsp) //moving left or right? right = 1, left = -1.
	var lay_id = layer_get_id("Tiles");
	var map_id = layer_tilemap_get_id(lay_id);

	bbox_side = p1hsp > 0 ? bbox_right : bbox_left;
	if(tilemap_get_at_pixel(tilemap, bbox_side + p1hsp, bbox_top) == CELL_TYPES.WALL ||
	  tilemap_get_at_pixel(tilemap, bbox_side + p1hsp, bbox_bottom) == CELL_TYPES.WALL ||
	  tilemap_get_at_pixel(tilemap, bbox_side + p1hsp, bbox_top) == CELL_TYPES.DOOR_CLOSED ||
	  tilemap_get_at_pixel(tilemap, bbox_side + p1hsp, bbox_bottom) == CELL_TYPES.DOOR_CLOSED) {
		//move as close as we can
		if(p1hsp > 0){
			x = x - (x mod 16) + 15 - (bbox_right - x);
		} else {
			x = x - (x mod 16) - (bbox_left - x);
		}
	    p1hsp = 0;
	}
	
	//MOVE CALCULATED AMOUNT
	x = x + p1hsp;
	
	//------------------------//
	
	// Vertical
	
	var onepixel = sign(p1vsp) //moving left or right? right = 1, left = -1.
	
	bbox_side = p1vsp > 0 ? bbox_top : bbox_bottom;
	if(tilemap_get_at_pixel(tilemap, bbox_right, bbox_side - p1vsp) == CELL_TYPES.WALL ||
	   tilemap_get_at_pixel(tilemap, bbox_left, bbox_side - p1vsp) == CELL_TYPES.WALL ||
	   tilemap_get_at_pixel(tilemap, bbox_right, bbox_side - p1vsp) == CELL_TYPES.DOOR_CLOSED ||
	   tilemap_get_at_pixel(tilemap, bbox_left, bbox_side - p1vsp) == CELL_TYPES.DOOR_CLOSED) {
		//move as close as we can

		if(p1vsp > 0){
			y = y - (y mod 16) + 15 - (bbox_bottom - y) + 1;
		} else {
			y = y - (y mod 16) - (bbox_top - y) - 1;
		}
	    p1vsp = 0;
	}
		//MOVE CALCULATED AMOUNT
	y = y - p1vsp;


