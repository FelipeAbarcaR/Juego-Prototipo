//esto hace que velocidad del texto cuando se despliege sea cada vez mas lento ?
lerpprogress += (1 - lerpprogress)/50;
textprogress += global.textspeed;

// devuelve el porcentaje que el tercer argumento entre los otros 2 valores (0, 10, 0.5) seria 50%
x1 = lerp(x1, x1target, lerpprogress);
x2 = lerp(x2, x2target, lerpprogress);

//Ciclo a traves respuestas
keyup = keyboard_check_pressed(vk_up)or keyboard_check_pressed(ord("W"));
keydown = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
responseselected += (keydown - keyup);
var _max = array_length(responses) - 1
var _min = 0;
if(responseselected > _max) responseselected = _min;
if(responseselected < _min) responseselected = _max;


if(keyboard_check_pressed(vk_space))
{
	var _messagelength = string_length(message);
	//se llego al final del mensaje
	if(textprogress >= _messagelength)
	{
		if(responses[0] != -1)
		{
			with(origininstance) DialogueResponses(other.responsescript[other.responseselected]);	
		}
				
			instance_destroy();
			if(instance_exists(obj_text_queued))
			{
				with(obj_text_queued) ticket --;
			}
		else 
		{
			with(obj_player) state = laststate;
		}
	}	
	else
	{
		//esto es para prevenir que apreten espacio sin ver un frame del texto antes, asi se previene de skipear el texto por equivacion
		if (textprogress > 2)
		{
			textprogress = _messagelength;
		}
	}
}