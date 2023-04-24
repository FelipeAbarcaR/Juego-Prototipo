if(!global.gamepaused)
{
	if(EntityState == EntityChase)
	{ 
		script_execute(EntityState);
		EntityActivateScript = -1;
		EntityActivateArgs = -1;
		
	}
}