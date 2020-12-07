switch(phase){
	case combat.setup:
		//turn off all layers
		layer_set_visible(targetUI, false);
		instance_deactivate_layer(targetUI);
		layer_set_visible(baseUI, false);
		instance_deactivate_layer(baseUI);
		layer_set_visible(skillsUI, false);
		instance_deactivate_layer(skillsUI);
	
		for (var i = 0; i < instance_number(oSpawn); i++){
			var _inst = instance_find(oSpawn,i);
			if (_inst.x < room_width/2){
				var _unit = instance_create_depth(_inst.x,_inst.y,0,oPlayer);
			} else {
				var _unit = instance_create_depth(_inst.x,_inst.y,0,oEnemy);
			}
			//ds_list_add(global.units, _unit);
		}
		phase = combat.roundStart;
		
	break;
	case combat.roundStart:
		for (var i = 0; i < instance_number(bUnit); i++){
			var _inst = instance_find(bUnit, i);
			ds_list_add(global.units, _inst);
		}
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
		if (global.selected.unitTeam > 0 && !aiDone){
			AIChoose();
		}
		if (global.selected.turnFinished){
			aiDone = false;
			unitsFinished++;
			phase = combat.process;
			event_user(0);
			//manually reset visibility
			layer_set_visible(targetUI, false);
			instance_deactivate_layer(targetUI);
			layer_set_visible(baseUI, false);
			instance_deactivate_layer(baseUI);
		}
	break;
	
	case combat.process:
		allies = 0;
		enemies = 0;
		if (processFinished){
			global.selected = noone;
			processFinished = false;
			for (var i = 0; i < ds_list_size(global.units); i++){
				with (global.units[|i]){
					drawTarget = false;
				}
			}
			phase = combat.checkEnd;
		}
	break;
	
	case combat.checkEnd:
		for (var i = 0; i < ds_list_size(global.units); i++){
			var _unit = global.units[| i];
			if (_unit.unitTeam == 0){//if the unit is an ally
				allies++;
			}else enemies++;
		}
		show_debug_message("allies "+string(allies)+" enemies "+string(enemies));
		if (allies<=0){
			phase = combat.lose;
		}
		else if (enemies <= 0){
			phase = combat.win;
		}
		else {
			phase = combat.roundEnd;
		}
	break;
	
	case combat.roundEnd:
		ds_list_clear(global.targets);
		ds_list_clear(global.selectedtargets);
		ds_list_clear(global.units);
		global.targeting = false;
		global.skillTargeting = false;
		phase = combat.roundStart;
	break;
	
	case combat.lose:
		show_message("You Lost!");
	break;
	
	case combat.win:
		show_message("You Won!");
	break;
	
}
