draw_text(0,0,"selected: "+string(global.selected)+" instances: "+string(instance_count)+", phase: "+string(phase)+", finished: "+string(unitsFinished)+", process finished: "+string(processFinished)+", input allowed: "+string(allowInputs)+", targeting: "+string(global.targeting)+", using skill? "+string(global.skillTargeting));
for(var i = 0; i < ds_list_size(global.targets); i++){
	draw_text(0, 16+(16*i), global.targets[|i]);
}
for(var i = 0; i < ds_list_size(global.selectedtargets); i++){
	draw_text(64, 16+(16*i), global.targets[|i]);
}
