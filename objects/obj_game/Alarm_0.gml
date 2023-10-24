/// @description return from fight
// You can write your code in this editor
if(instance_exists(obj_textbox))
{

    obj_textbox.fight_concluded=true;
	obj_textbox.event_mode=textbox_event.TEXTING
	
}

uc_set_mode(CMODE.OBJECT_BORDERS);

