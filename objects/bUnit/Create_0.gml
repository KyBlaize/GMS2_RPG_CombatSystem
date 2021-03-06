#macro Camera_Width camera_get_view_width(view_camera[0])
#macro Camera_Height camera_get_view_height(view_camera[0])

#macro Display_ScaleX display_get_gui_width()/Camera_Width
#macro Display_ScaleY display_get_gui_height()/Camera_Height

#macro IDLE 0
#macro ATTACK 1
#macro HURT 2
#macro MISS 3
#macro DEATH 4
#macro CAST 5
#macro DEFEND 6
#macro MAGIC 7

state = IDLE;

//base stats
unitTeam = 0; //0 = player, 1 = enemy
maxHealth = 10;
maxSkillPoints = 4;
baseSpeed = irandom_range(1,10);

//variable stats
currentHealth = maxHealth;
currentSpeed = baseSpeed;
currentSkillPoints = maxSkillPoints;

hurt = function(amount){
	currentHealth -= amount;
}

spendSkillPoints = function(amount){
	currentSkillPoints -= amount;
}

attackWillHit = -1;
defending = false;
turnFinished = false;
drawTarget = false;
selected = false;
selectedSkill = -1

hpBarHeight = sprite_get_height(vHP);
hpBarWidth = sprite_get_width(vHP);

learnedSkill[0] = -1;
learnedSkill[1] = -1;