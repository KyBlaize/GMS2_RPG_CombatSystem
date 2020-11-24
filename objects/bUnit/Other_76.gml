if (event_data[? "event_type"] == "sequence event"){
	switch(event_data[? "message"]){
		case "CheckAttack":
			if (id == global.selected){
				show_debug_message(string(id)+" is attacking");
				checktoHit();
			}else show_debug_message(string(id)+" is not attacking");
		break;
		
		case "PlayerDefend":
			if (id == global.selected){
				show_debug_message(string(id)+" is definding");
				defend();
			}else show_debug_message(string(id)+" is not defending");
		break;
		
		case "SendAttack":
			if (global.selected.attackWillHit){
				for(var i = 0; i < ds_list_size(global.selectedtargets); i++){
					with (global.selectedtargets[|i]){
						if (defending){
							defending = false;
						}
						state = HURT;
						layer_sequence_headpos(playerSequence, hurtStart);
					}
				}
			}
		break;
	}
}
