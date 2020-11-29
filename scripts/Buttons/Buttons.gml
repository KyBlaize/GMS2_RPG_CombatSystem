function AttackMenu(){
	//show targetUI
	show_debug_message("Show Attack Menu");
	global.targeting = true;
	with(cManager){
		event_user(0); //disable input
		event_user(1);
		event_user(2);
		event_user(0); //enable input
	}
}

function SkillMenu(){
	show_debug_message("Show Skill Menu");
	with(cManager){
		event_user(0); //disable input
		event_user(1);
		event_user(3);
		event_user(0); //enable input
	}
}

function SkillButton(){
	show_debug_message("Go To Targeting");
	global.skillTargeting = true;
	global.selected.selectedSkill = global.selected.learnedSkill[@ ds_list_find_index(global.skillsButtons, id)];
	with(cManager){
		event_user(0); //disable input
		event_user(2);
		event_user(3);
		event_user(0); //enable input
	}
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
	
	with(cManager){
		event_user(1);
		if (layer_get_visible(targetUI))
			event_user(2);
		else if (layer_get_visible(skillsUI))
			event_user(3);
	}
}