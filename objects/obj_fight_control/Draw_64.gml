/// @description Insert description here
// You can write your code in this editor
if(fighters_created)
{
	var _bp=global.beatprogress;
	var _add_scale_size=0.15;
	var _calculito=(power((0.5-_bp),2));
	var _add_scale=_add_scale_size*_calculito;
	var _initial_scale=0.8;
	
	//FIGHTER 1
		var _bar,_hp1,_hpmax1,_x,_y,_scale;
		_hp1=fighter1.hp;
		_hpmax1=fighter1.hpmax;
		_bar=spr_hpbar3;
		_x=marginw;
		_y=marginh;
		_scale=_initial_scale+_add_scale;
	
		var _spritewidth=sprite_get_width(_bar);
		var _spriteheight=sprite_get_height(_bar);

		//background
		draw_sprite_ext(_bar,0,_x,_y,_scale,_scale,image_angle,image_blend,image_alpha);

		//animation 2nd hp

		if(decreasing)
		{
			width_value-=decrease_value;
		}
	
		draw_sprite_part_ext(_bar,2,0,0,_spritewidth*width_value,_spriteheight,_x,_y,_scale,_scale,c_white,1);


		var _currenthp=(_hp1/_hpmax1);
		//hp
		draw_sprite_part_ext(_bar,3,0,0,_spritewidth*_currenthp,_spriteheight,_x,_y,_scale,_scale,c_white,1);

		if(width_value<=_currenthp)
		{
		    decreasing=false;
	
		}

	//FIGHTER2

	var _hp2,_hpmax2,_x2,_y2;
		_hp2=fighter2.hp;
		_hpmax2=fighter2.hpmax;
		_x2=display_get_gui_width()/2 + marginw;
		_y2=marginh;
		//_scale=1.5;


		//background
		draw_sprite_ext(_bar,0,_x2,_y2,_scale,_scale,image_angle,image_blend,image_alpha);

		//animation 2nd hp

		if(decreasing2)
		{
			width_value2-=decrease_value;
		}
	
		draw_sprite_part_ext(_bar,2,0,0,_spritewidth*width_value2,_spriteheight,_x2,_y2,_scale,_scale,c_white,1);


		var _currenthp2=(_hp2/_hpmax2);
		//hp
		draw_sprite_part_ext(_bar,3,0,0,_spritewidth*_currenthp2,_spriteheight,_x2,_y2,_scale,_scale,c_white,1);

		if(width_value2<=_currenthp2)
		{
		    decreasing2=false;
	
		}
}