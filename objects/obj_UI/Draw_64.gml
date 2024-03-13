/// @description Draw UI
if(global.gamemode!=mode.fight && !instance_exists(obj_fight_control))
{
	//Draw Health
	var _playerhealth = global.playerhealth;
	var _playerhealthmax = global.playerhealthmax;
			//frac te de vuelve la fraccion restantes dps de entero, es decir, de 7.2 te devuelve 0.2
	var _playerhealthfrac = frac(_playerhealth);

	_playerhealth -= _playerhealthfrac;

	for( var i = 1; i <= _playerhealthmax ; i++)
	{
			//Como hay un condicional, te devuelve una true o false, es decir, 1 o 0 si es que se cumple la condicion;
			//0 en este caso seria un corazon entero dado el frame del sprite
			//1 en este caso seria un corazon vacio 
		var _imageindex = (i > _playerhealth);
		if( i == _playerhealth +1)
		{
			//Cada caso dibujara una fraccion de corazon dependiendo del frame del sprite
			//!/4 de corazon (frame 2)
			_imageindex += (_playerhealthfrac > 0);
			//medio corazon (frame 3)
			_imageindex += (_playerhealthfrac > 0.25);
			//3/4 de corazon (frame 4)
			_imageindex += (_playerhealthfrac > 0.5);
		}
		var _scale=3;
		var _extraspacing =30;
		draw_sprite_ext(spr_health,_imageindex,20 +((i-1)*(16+_extraspacing)),20,_scale,_scale,image_angle,c_white,image_alpha);
	}
}

