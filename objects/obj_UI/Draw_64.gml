/// @description Draw UI
var _x_pos=display_get_gui_width()*0.1;
var _y_pos=display_get_gui_height()*0.05;
var _bp=global.beatprogress//(global.beatprogress*2)-1;
var _extra=scr_distribucion_n(_bp,0,0.08,0.06);
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
		var _scale=4+_extra;
		var _extraspacing =80;
		draw_sprite_ext(spr_health,_imageindex,_x_pos +((i-1)*(_extraspacing)),_y_pos,_scale,_scale,image_angle,c_white,image_alpha);
	}
}

