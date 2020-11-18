///@description click selection
//show_debug_message(string(mouse_x)+", "+string(mouse_y));

//select a target for attack
if (global.targeting){
	if (position_meeting(mouse_x, mouse_y, bUnit)){
		var _unit = instance_position(mouse_x, mouse_y, bUnit);
		if (_unit.unitTeam != global.selected.unitTeam){
			show_debug_message("Unit "+string(_unit)+" at "+string(mouse_x)+", "+string(mouse_y));
			//global.targeting = false;
		
			with (global.selected){
				ds_list_clear(global.selectedtargets);
				state = ATTACK;
				layer_sequence_headpos(playerSequence, attackStart);
				ds_list_add(global.selectedtargets, _unit);
			}
		}
	} 
}