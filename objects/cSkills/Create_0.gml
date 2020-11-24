/// @description 
enum skillStat{
	name,
	type, //element
	targets,
	healthChange,
	cost,
	action, //function
	total
};

enum skillType{
	physical,
	magic,
	total
};

enum skillElement{
	none,
	fire,
}

global.skillIndex = ds_grid_create(skillType.total,skillStat.total);
ds_grid_clear(global.skillIndex, 0);

addSkill(0, "Slash", skillElement.none, 1, 2, 1, singleTargetAttack);
addSkill(1, "Multi-Slash", skillElement.none, 2, 2, 2, multiTargetAttack);
addSkill(2, "Fire", skillElement.fire, 1, 3, 3, singleTargetAttack);
