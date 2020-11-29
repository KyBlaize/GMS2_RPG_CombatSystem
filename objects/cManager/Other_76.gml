if (event_data[? "event_type"] == "sequence event"){
	switch(event_data[? "message"]){
		case "SendAttack":
		case "SendMagic":
			global.selected.turnFinished = true;
		break;
		
		case "PlayerHurt":
		//break;
		case "PlayerMiss":
			processFinished = true;
		break;
		case "PlayerDefend":
			global.selected.turnFinished = true;
			processFinished = true;
		break;
		
		case "PlayerDeath":
			for (var i = 0; i < ds_list_size(global.selectedtargets); i++){
				var _unit = global.selectedtargets[|i];
				if (_unit.currentHealth <= 0){
					var _pos = ds_list_find_index(global.units, _unit);
					ds_list_delete(global.units, _pos);
				}
			}
			processFinished = true;
		break;
	}
}

