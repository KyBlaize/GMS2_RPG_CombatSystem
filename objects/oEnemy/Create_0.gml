// Inherit the parent event
event_inherited();

//overrides
unitTeam = 1;

playerSequence = layer_sequence_create("Sequences", x, y, Enemy1);

//sequence sections
idleStart = 0;
idleEnd = 19;
attackStart = 20;
attackEnd = 49;
missStart = 50;
missEnd = 69;
hurtStart = 70;
hurtEnd = 89;
deathStart = 90;
deathEnd = 119;
castStart = 120;
castEnd = 149;
defendStart = 150;
defendEnd = 169;
magicStart = 170;
magicEnd = 199;

learnedSkill[0] = global.skill[skill.slash];
learnedSkill[1] = global.skill[skill.multiSlash];