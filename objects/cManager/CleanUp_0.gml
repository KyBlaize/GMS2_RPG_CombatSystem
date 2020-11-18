if (ds_exists(global.targets, ds_type_list)){
	ds_list_destroy(global.targets);
}
if(ds_exists(global.selectedtargets, ds_type_list)){
	ds_list_destroy(global.selectedtargets);
}
if(ds_exists(global.units, ds_type_list)){
	ds_list_destroy(global.units);
}

