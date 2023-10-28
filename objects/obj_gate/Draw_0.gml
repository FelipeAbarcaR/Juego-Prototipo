/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();




var draw_aranitas=function()
{
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
}



switch (state)
{
    case GATESTATE.opening:	
	
	x=xstart-opening_progress;
	
	y=ystart+irandom(2)-1;
	draw_sprite(spr_gate_right,0,xstart+32+opening_progress,y);

	if(opening_progress==opening_distance)
	{
	    y=ystart;
	}
	break;
	
	case GATESTATE.closed:
	draw_sprite(spr_gate_right,0,xstart+32,ystart);
	
	draw_aranitas();
	break;
	
	case GATESTATE.open:
	draw_sprite(spr_gate_right,0,xstart+32+opening_distance,y);
	break;

	
}

