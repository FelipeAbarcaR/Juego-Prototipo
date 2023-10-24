/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

//draw right gate
draw_sprite(spr_gate_right,0,x+32,y);


if(aranitas>0)
{
	var _time=global.BeatNumber+global.beatprogress;
	spider_alpha=(sin(((_time/2)+1.5)*pi)+1)*0.5;
	for(var i=0;i<aranitas;i++)
	{
		var _x=x+posicion_arana[i][0];
		var _y=y+posicion_arana[i][1];
		
		draw_sprite_ext(spr_gate_spider,0,_x,_y,1,1,0,c_white,spider_alpha);
		if (i==2) break;	
	}

}

