switch (state){
	case IDLE:
		if (!defending){
			if(layer_sequence_get_headpos(playerSequence) > idleEnd){
				layer_sequence_headpos(playerSequence, idleStart);
			}
		}
	break;
	case ATTACK:
		if(layer_sequence_get_headpos(playerSequence) > attackEnd){
			if (attackWillHit){
				layer_sequence_headpos(playerSequence, idleStart);
				state = IDLE;
				//show_debug_message("HIT!");
			} else { 
				layer_sequence_headpos(playerSequence, missStart);
				state = MISS;
				//show_debug_message("MISS!");
			}
		}
	break;
	case HURT:
		if(layer_sequence_get_headpos(playerSequence) > hurtEnd){
			hurt(2); //put some calculations in
			if (currentHealth > 0){
				layer_sequence_headpos(playerSequence, idleStart);
				cManager.processFinished = true;//hack
				state = IDLE;
			} else {
				layer_sequence_headpos(playerSequence, deathStart);
				state = DEATH;
			}
		}
	break;
	case MISS:
		if(layer_sequence_get_headpos(playerSequence) > missEnd){
			layer_sequence_headpos(playerSequence, idleStart);
			state = IDLE;
		}
	break;
	case DEATH:
		if(layer_sequence_get_headpos(playerSequence) > deathEnd){
			//layer_sequence_headpos(playerSequence, deathEnd);
			//layer_sequence_destroy(playerSequence);
			instance_destroy();
		}
	break;
	case CAST:
		if(layer_sequence_get_headpos(playerSequence) > castEnd){
			layer_sequence_headpos(playerSequence, defendStart);
			state = DEFEND;
		}
	break;
	case DEFEND:
		if(layer_sequence_get_headpos(playerSequence) > defendEnd){
			layer_sequence_headpos(playerSequence, defendStart);
		}
	break;
}

if (global.targeting && global.selected != noone){
	if (position_meeting(mouse_x, mouse_y, id) && unitTeam != global.selected.unitTeam){
		drawTarget = true;
	} else drawTarget = false;
}