function AttackMenu(){
	//show targetUI
	global.targeting = true;
	for (var i = 0; i < ds_list_size(global.units); i++){
		var _inst = global.units[| i];
		if (_inst.unitTeam != global.selected.unitTeam){
			ds_list_add(global.targets, _inst);
		}
	}
	with(cManager){
		event_user(0); //disable input
		event_user(1);
		event_user(2);
		event_user(0); //enable input
	}
}

function SkillMenu(){
	with(cManager){
		event_user(0); //disable input
		event_user(1);
		event_user(3);
		event_user(0); //enable input
	}
}

function SkillButton(){
	var _cost = global.selected.learnedSkill[@ ds_list_find_index(global.skillsButtons, id)].cost;
	var _sp = global.selected.currentSkillPoints;
	if (_sp >= _cost){
		global.skillTargeting = true;
		global.selected.selectedSkill = global.selected.learnedSkill[@ ds_list_find_index(global.skillsButtons, id)];
		for (var i = 0; i < ds_list_size(global.units); i++){
			var _inst = global.units[| i];
			if (_inst.unitTeam != global.selected.unitTeam){
			ds_list_add(global.targets, _inst);
			}
		}
		with(cManager){
			event_user(0); //disable input
			event_user(2);
			event_user(3);
			event_user(0); //enable input
		}
	}else show_message("Not enough skill points!");
	
}

function DefendButton(){
	if (cManager.allowInputs){
		with (global.selected){
			state = CAST;
			layer_sequence_headpos(playerSequence, castStart);
		}
		with(cManager){
			//event_user(0); //disable input
			event_user(1);
		}
	}
}

function CancelButton(){
	global.selected.selectedSkill = -1;
	global.targeting = false;
	global.skillTargeting = false;
	ds_list_clear(global.targets);
	with(cManager){
		event_user(1);
		if (layer_get_visible(targetUI))
			event_user(2);
		else if (layer_get_visible(skillsUI))
			event_user(3);
	}
}