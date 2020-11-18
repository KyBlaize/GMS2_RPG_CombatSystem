if (phase = combat.ready){	
	with (global.selected){
		ds_list_clear(global.selectedtargets);
		state = ATTACK;
		layer_sequence_headpos(playerSequence, attackStart);
		ds_list_copy(global.selectedtargets, global.targets);
	}
}