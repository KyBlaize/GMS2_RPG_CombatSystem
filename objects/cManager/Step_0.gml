switch(phase){
	case combat.setup:
		for (var i = 0; i < instance_number(oSpawn); i++){
			var _inst = instance_find(oSpawn,i);
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
		bubbleSort(global.units);
		
		if (unitsFinished >= ds_list_size(global.units)){
			for (var i = 0; i < ds_list_size(global.units); i++){
				with (global.units[|i]){
					turnFinished = false;
				}
			}
			unitsFinished = 0;
		}
		
		for (var i=0; i < ds_list_size(global.units); i++){
			var _unit = global.units[|i];
			if (!_unit.turnFinished){
				with (_unit){
					event_user(0);
				}
				global.selected = _unit;
				break;
			}
		}
		
		if (!allowInputs){
			allowInputs = true;
			event_user(1);
		}
		phase = combat.ready;
		
	break;
	
	case combat.ready:
		
		if (global.selected.turnFinished){
			unitsFinished++;
			phase = combat.process;
			skillTargeting = false;
			event_user(0);
			//manually reset visibility
			layer_set_visible(targetUI, false);
			instance_deactivate_layer(targetUI);
			layer_set_visible(baseUI, false);
			instance_deactivate_layer(baseUI);
		}
	break;
	
	case combat.process:
		if (processFinished){
			global.selected = noone;
			processFinished = false;
			for (var i = 0; i < ds_list_size(global.units); i++){
				with (global.units[|i]){
					drawTarget = false;
				}
			}
			phase = combat.roundEnd;
		}
	break;
	
	case combat.roundEnd:
		ds_list_clear(global.targets);
		ds_list_clear(global.selectedtargets);
		global.targeting = false;
		phase = combat.roundStart;
	break;
}
