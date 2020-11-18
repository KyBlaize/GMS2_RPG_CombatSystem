var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var xx = (x-cx)*Display_ScaleX;
var yy = (y-cy)*Display_ScaleY;
var _hp = currentHealth/maxHealth;

draw_text(xx,yy,string(id)+", "+string(state)+", "+string(turnFinished)+", speed: "+string(currentSpeed));

draw_sprite(vHP,0,xx,yy-16);
draw_sprite_part(vHP,1,0,0,hpBarWidth*_hp,hpBarHeight,xx,yy-16);
