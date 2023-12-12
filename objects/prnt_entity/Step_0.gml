/// @description npc follow

switch(npc_state)
{
	default:
	
		npc_dialogue_interaction();
	
		npc_space_bar();
		
	break;
	
	case npc_states.FOLLOW:
	
		npc_following_animation();
		
	break;
	
}












