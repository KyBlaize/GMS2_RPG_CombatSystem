var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var xx = (x-cx)*Display_ScaleX;
var yy = (y-cy)*Display_ScaleY;
var _hp = currentHealth/maxHealth;
var _sp = currentSkillPoints/maxSkillPoints;

draw_text(xx,yy,string(id));

draw_sprite(vHP,0,xx,yy-16);
draw_sprite_part(vHP,1,0,0,hpBarWidth*_hp,hpBarHeight,xx,yy-16);
draw_sprite(vSP,0,xx+48,yy-16);
draw_sprite_part(vSP,1,0,0,hpBarWidth*_sp,hpBarHeight,xx+48,yy-16);
