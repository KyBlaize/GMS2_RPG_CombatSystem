/// @description Skills UI

if (layer_get_visible(skillsUI)){
	layer_set_visible(skillsUI, false);
	instance_deactivate_layer(skillsUI);
} else {
	layer_set_visible(skillsUI, true);
	for (var i = 0; i < ds_list_size(global.skillsButtons); i++){
		var _btn = global.skillsButtons[|i];
		_btn.buttonLabel = global.selected.learnedSkill[i].name;
	}
	instance_activate_layer(skillsUI);
}
