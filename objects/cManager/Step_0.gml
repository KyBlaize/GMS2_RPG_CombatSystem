switch(phase){
	case combat.setup:
		for (var i = 0; i < instance_number(oSpawn); i++){
			var _inst = instance_find(oSpawn,i);
			//TODO: spawn player and enemy
			if (_inst.x < room_width/2){
				var _unit = instance_create_depth(_inst.x,_inst.y,0,oPlayer);
			} else {
				var _unit = instance_create_depth(_inst.x,_inst.y,0,oEnemy);
			}
			ds_list_add(global.units, _unit);
		}
		
		phase = combat.roundStart;
		
	break;
	case combat.roundStart:
		
		/*for (var i = 0; i < instance_number(bUnit); i++){
				var _unit = instance_find(bUnit, i);
				//show_message(string(_unit)+" added to the list.");
				ds_list_add(global.units, _unit);
		}*/
		
		if (unitsFinished >= ds_list_size(global.units)){
			for (var i = 0; i < ds_list_size(global.units); i++){
				with (global.units[|i]){
					turnFinished = false;
				}
			}
			unitsFinished = 0;
		}
		
		//pick the first unit that has NOT had their turn
		for (var i=0; i < ds_list_size(global.units); i++){
			var _unit = global.units[|i];
			if (!_unit.turnFinished){
				//global.selected = _unit;
				with (_unit){
					event_user(0);
				}
				break;
			}
		}
		global.selected = _unit;
		
		//temp targeting
		for(var i=0; i < instance_number(bUnit); i++){
			var _unit = instance_find(bUnit, i);
			if (_unit != global.selected && _unit.unitTeam != global.selected.unitTeam){
				ds_list_add(global.targets, _unit);
			}
		}
		//temp targeting
		
		if (!allowInputs){
			//show_message("Allow Inputs");
			allowInputs = true;
			event_user(1);
		}
		phase = combat.ready;
		
	break;
	
	case combat.ready:
		
		if (global.selected.turnFinished){
			//show_message("Turn Finished");
			unitsFinished++;
			phase = combat.process;
			event_user(0);
			//event_user(1);
			event_user(2);
		}
	break;
	
	case combat.process:
		if (processFinished){
			//show_message("Process Finished");
			global.selected = noone;
			processFinished = false;
			//ds_list_clear(global.units);
			phase = combat.roundEnd;
		}
	break;
	
	case combat.roundEnd:
		ds_list_clear(global.targets);
		ds_list_clear(global.selectedtargets);
		phase = combat.roundStart;
	break;
}
