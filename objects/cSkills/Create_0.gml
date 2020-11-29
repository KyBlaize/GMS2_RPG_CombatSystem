/// @description 
enum skillStat{
	name,
	element, //set with skillElement
	type, //set with skillType
	targets,
	healthChange,
	cost,
	action //function to run
};

enum skillType{
	physical,
	magic,
};

enum skillElement{
	none,
	fire,
}

enum skill{
	slash,
	multiSlash,
}

Skill = function(_name, _element, _type, _targets, _healthChange, _cost, _action) constructor {
	name = _name;
	element = _element;
	type = _type;
	targets = _targets;
	healthChange = _healthChange;
	cost = _cost;
	action = _action;
}

global.skill[skill.slash] = new Skill("Slash", skillElement.none, skillType.physical, 1, 2, 2, singleTargetAttack);
global.skill[skill.multiSlash] = new Skill("M-Slash", skillElement.none, skillType.physical, 1, 2, 2, multiTargetAttack);
