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
global.skillTargeting = false;

unitsFinished = 0;
processFinished = false;
allowInputs = false;


instance_create_depth(0,0,0, cSkills);

//layers
baseUI = layer_get_id("BaseMenu");
targetUI = layer_get_id("TargetingMenu");
skillsUI = layer_get_id("SkillsMenu");