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
		event_user(2);
		event_user(0); //enable input
	}
	//buttonLabel = "Cancel";
	//mainFunction = CancelButton;
}

function DefendButton(){
	if (cManager.allowInputs){
		with (global.selected){
			state = CAST;
			layer_sequence_headpos(playerSequence, castStart);
		}
	//show_debug_message("Send to Defend");
		with(cManager){
			event_user(0); //disable input
			event_user(1);
		}
	}
}

function CancelButton(){
	//hide targetUI
	global.targeting = false;
	show_debug_message("Cancel");
	with(cManager){
		event_user(1);
		event_user(2);
	}
}