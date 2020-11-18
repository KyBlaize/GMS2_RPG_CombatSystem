if (event_data[? "event_type"] == "sequence event"){
	switch(event_data[? "message"]){
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
