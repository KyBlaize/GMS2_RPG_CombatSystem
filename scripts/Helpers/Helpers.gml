function bubbleSort(_list){
	var _listSize = ds_list_size(_list);
	for (var i = 0; i < _listSize - 1; i++){
		for (var j = 0; j < _listSize - i - 1; j++){
			if (_list[|j].currentSpeed < _list[|j + 1].currentSpeed){ // > Fastest last, < Slowest last
			//swap the two
			var _temp = _list[| j];
			_list[|j] = _list[|j + 1];
			_list[|j + 1] = _temp;
			}
		}
	}
	show_debug_message("Sort Completed");
}

function AIChoose(){
	cManager.aiDone = true;
	var _choice = random(1);
	if (_choice > 0.5){ //defend
		with (global.selected){
			state = CAST;
			layer_sequence_headpos(playerSequence, castStart);
		}
		with(cManager){
			event_user(1);
		}
	}
	else{ //attack
		for (var i = 0; i < ds_list_size(global.units); i++){
			var _inst = global.units[| i];
			if (_inst.unitTeam != global.selected.unitTeam){
				ds_list_add(global.targets, _inst);
			}
		}
		var _unit = global.targets[| irandom(1)];
		ds_list_clear(global.selectedtargets);
		with (global.selected){
			state = ATTACK;
			layer_sequence_headpos(playerSequence, attackStart);
		}
		ds_list_add(global.selectedtargets, _unit);
	}
}