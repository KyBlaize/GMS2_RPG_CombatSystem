/// @description Skills UI

if (layer_get_visible(skillsUI)){
	layer_set_visible(skillsUI, false);
	instance_deactivate_layer(skillsUI);
} else {
	layer_set_visible(skillsUI, true);
	instance_activate_layer(skillsUI);
}
