// Auto-generated stubs for each available event.
function checkToHit(){
	var hitChance = random(1) > 0.2 ? true : false;
	with (global.selected){
		attackWillHit = hitChance;
	}
}

function unitDefend(){
	with(global.selected){
		defending = true;
	}
}

function unitAttack(){
	if (global.selected.attackWillHit){
		for(var i = 0; i < ds_list_size(global.selectedtargets); i++){
			with (global.selectedtargets[|i]){
				if (defending){
					defending = false;
				}
				state = HURT;
				layer_sequence_headpos(playerSequence, hurtStart);
			}
		}
	}
}

function unitMagic(){
if (global.selected.attackWillHit && !cManager.magicSent){
		cManager.magicSent = true;
		for(var i = 0; i < ds_list_size(global.selectedtargets); i++){
			with (global.selectedtargets[|i]){
				if (defending){
					defending = false;
				}
				state = HURT;
				layer_sequence_headpos(playerSequence, hurtStart);
			}
		}
	}
}

function singleTargetAttack(_unit){
	ds_list_add(global.selectedtargets, _unit);
}

function multiTargetAttack(){
	ds_list_copy(global.selectedtargets, global.targets);
}
