// Auto-generated stubs for each available event.

function CheckHit()
{
	var hitChance = random(1) > 0 ? true : false;
	global.selected.attackWillHit = hitChance;
}

function UnitDefend(){
	var _unit = global.selected;
	_unit.defending = true;
	_unit.turnFinished = true;
}

function UnitDied(){
}