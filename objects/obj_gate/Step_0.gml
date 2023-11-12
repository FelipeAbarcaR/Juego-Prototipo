/// @description Insert description here
// You can write your code in this editor
if(id == global.activate && EntitySpaceBarActive) 
{
	hola=10;
	hola=20
}
event_inherited();
var _list = obj_game.inv_list
var _list_size = ds_list_size(_list);

for(var i=0;i<ds_list_size(_list);i++)
{
    var _arr=_list[|i];
	if(_arr[0]==ITEM.BUG)
	{
	    aranitas=_arr[1];
	}
	if(aranitas>=3)
	{
	    EntityActivateScript=OpenGate;
		EntityActivateArgs = [-1];
		EntitySpaceBarActive=true;
	}
}

if(gate_activated)
{
    gate_activated=false;
	uc_shake(10,0.1);
	uc_set_mode(CMODE.OBJECT_FOLLOWING)
	uc_set_instance_following_list(o_player);
	state=GATESTATE.opening;
}

switch (state)
{
    case GATESTATE.opening:
	opening_progress=min(opening_progress+opening_speed,opening_distance);
	if(opening_progress>=opening_distance)
	{
	    state=GATESTATE.open;
	}
}
