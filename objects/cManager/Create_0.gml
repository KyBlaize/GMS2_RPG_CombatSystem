randomize();

enum combat{
	setup,
	roundStart,
	ready,
	process,
	roundEnd
};
phase = combat.setup;

global.selected = noone;
global.units = ds_list_create();
global.targets = ds_list_create(); //potential targets
global.selectedtargets = ds_list_create(); //actual targets
global.skillsButtons = ds_list_create();
global.targeting = false;

unitsFinished = 0;
processFinished = false;
allowInputs = false;
skillTargeting = false;

instance_create_depth(0,0,0, cSkills);

//layers
baseUI = layer_get_id("BaseMenu");
targetUI = layer_get_id("TargetingMenu");
skillsUI = layer_get_id("SkillsMenu");

//turn off all layers
layer_set_visible(targetUI, false);
instance_deactivate_layer(targetUI);
layer_set_visible(baseUI, false);
instance_deactivate_layer(baseUI);
layer_set_visible(skillsUI, false);
instance_deactivate_layer(skillsUI);