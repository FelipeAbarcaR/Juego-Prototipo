if(!global.gamepaused)
{
	if(enemyScript[state] != -1) script_execute(enemyScript[state]);
	depth = -bbox_bottom;
}
