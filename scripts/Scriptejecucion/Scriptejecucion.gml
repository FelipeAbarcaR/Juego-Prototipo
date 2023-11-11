function ScriptExecuteArrayCS(_scr){
/// @desc ScriptExecuteArray
/// @arg Scriptid

	switch (array_length(_scr)-1) 
	{
 
		 case 0: return script_execute(_scr[0]);
		 
		 case 1: return script_execute(_scr[0], _scr[1]);
 
		 case 2: return script_execute(_scr[0], _scr[1], _scr[2]);
 
		 case 3: return script_execute(_scr[0], _scr[1], _scr[2], _scr[3]);
 
		 case 4: return script_execute(_scr[0], _scr[1], _scr[2], _scr[3], _scr[4]);
 
		 case 5: return script_execute(_scr[0], _scr[1], _scr[2], _scr[3], _scr[4], _scr[5]);
 
		 case 6: return script_execute(_scr[0], _scr[1], _scr[2], _scr[3], _scr[4], _scr[5], _scr[6]);
 
		 case 7: return script_execute(_scr[0], _scr[1], _scr[2], _scr[3], _scr[4], _scr[5], _scr[6], _scr[7]);
		 
		 case 8: return script_execute(_scr[0], _scr[1], _scr[2], _scr[3], _scr[4], _scr[5], _scr[6], _scr[7], _scr[8]);
 
		 default: show_error("script_execute_array: argument count not supported!", false);
	}

}

function ScriptExecuteArray(){
	
	var _scr = argument0;
	var _args = argument1;
	
	var _len=array_length(_args)
	switch (_len) 
	{
		 case 0: return script_execute(_scr);	
			
		 case 1: return script_execute(_scr, _args[0]);
 
		 case 2: return script_execute(_scr, _args[0], _args[1]);
 
		 case 3: return script_execute(_scr, _args[0], _args[1], _args[2]);
 
		 case 4: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3]);
 
		 case 5: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3], _args[4]);
 
		 case 6: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3], _args[4], _args[5]);
 
		 case 7: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6]);
 
		 case 8: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7]);
 
		 default: show_error("script_execute_array: argument count not supported!", false);
	}

}
