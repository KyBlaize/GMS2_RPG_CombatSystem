if (event_data[? "event_type"] == "sequence event"){
	switch(event_data[? "message"]){
		
		case "PlayerDeath":
		case "PlayerMiss":
			processFinished = true;
		break;
		
		case "PlayerDefend":
			global.selected.turnFinished = true;
			processFinished = true;
		break;
		
		case "SendAttack":
			global.selected.turnFinished = true;
		break;
		
		case "SendMagic":
			global.selected.turnFinished = true;
			magicSent = false;
		break;
	}
}

