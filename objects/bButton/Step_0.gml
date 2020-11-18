if (btnState == buttonState.active) {
	if (mainFunction!=noone && position_meeting(MOUSEGUI_X,MOUSEGUI_Y,id)) {
		image_index = 1;
		if (hoverFunction != noone){
			script_execute(hoverFunction);
		}
		if (mouse_check_button(mb_left)){
			image_index = 2;
		}
		if (cManager.allowInputs && mouse_check_button_released(mb_left)) {
			script_execute(mainFunction);
			//btnState = buttonState.inactive;
		}
	} else
		image_index = 0;
}