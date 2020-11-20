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
global.targeting = false;

unitsFinished = 0;
processFinished = false;
allowInputs = false;

//layers
baseUI = layer_get_id("BaseMenu");
targetUI = layer_get_id("TargetingMenu");

//turn off all layers
layer_set_visible(targetUI, false);
instance_deactivate_layer(targetUI);
layer_set_visible(baseUI, false);
instance_deactivate_layer(baseUI);