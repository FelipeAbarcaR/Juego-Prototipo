if(global.textover)
{
	with(instance_id) // no funciona
	{
		EntityActivateScript = -1;
		EntityActivateArgs = [-1];
	}
}
// flash ira disminuyendo esta llegar a 0
flash = max(flash - 0.04, 0);