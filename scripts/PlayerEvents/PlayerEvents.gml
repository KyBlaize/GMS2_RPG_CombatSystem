// Auto-generated stubs for each available event.

function addSkill(_skillid, _name, _type, _targets, _healthChange, _cost, _script){
	global.skillIndex[# _skillid, skillStat.name] = _name;
	global.skillIndex[# _skillid, skillStat.type] = _type;
	global.skillIndex[# _skillid, skillStat.targets] = _targets;
	global.skillIndex[# _skillid, skillStat.healthChange] = _healthChange;
	global.skillIndex[# _skillid, skillStat.cost] = _cost;
	global.skillIndex[# _skillid, skillStat.action] = _script;
}

function singleTargetAttack(_target){
	show_debug_message("Use skill on "+string(_target));
}

function multiTargetAttack(_number, _mainTarget){
	show_debug_message("Use skill on "+string(_mainTarget) + " "+string(_number)+" other/s");
}