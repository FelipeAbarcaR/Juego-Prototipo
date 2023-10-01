/// @description end fight
if(instance_exists(o_player))
{
    o_player.state=states.LOCK;
}
//Create fighters (if the transition out ended)
if(create_fighters)
{
    create_fighters=false;
	if (layer_exists("fighters")) layer_destroy("fighters");
	var _lay = layer_create(depth-1,"fighters");
	var _x1 = lerp(x,x+global.res.width,0.25);
	var _x2 = lerp(x,x+global.res.width,0.75);
	var _y = lerp(y,y+global.res.height,0.7);
	
	instance_create_layer(_x1,_y,_lay,fighter1,{image_xscale:2,image_yscale:2});
	instance_create_layer(_x2,_y,_lay,fighter2,{image_xscale:2,image_yscale:2});
	
	instance_deactivate_object(prnt_entity);
	fighters_created = true;
	beat_counting=true;
}

//create counting hand (once reached some beat counts)
if(beat_counting)
{
    if(global.beat)
	{
	    beat_count++;
		if(beat_count>=beats_to_start)
		{
			var _x1,_y1;
			_x1=x+global.res.width*0.35;
			_y1=y+global.res.height*0.15;
		    handcreate();
			beat_count=0;
			beat_counting=false;
		}
	}
}

//start fight! fighters can move, fight is in progress
if(global.start_fight)
{
    global.start_fight=false;
	fight_status=fighting.inprogress;
	fighter1.state="idle";
	fighter2.stance=EnemyStance.wait;
}

//MID-FIGHT STUFF

if(fighters_created)
{
//fight end

	if(fight_status==fighting.inprogress)
	{
		if(obj_Conde.hp<=0)
		{
		   obj_Conda.stance=EnemyStance.locked;
		   fight_status=fighting.ending;
			victory=false;
			alarm[3]=room_speed;
		}
		
		if(obj_Conda.hp<=0)
		{
			obj_Conda.stance=EnemyStance.dead;
			fight_status=fighting.ending;
			victory=true;
			alarm[3]=room_speed;
			with(obj_Conde)	state="stop";
		
		}
	}

//Decreasing hp animation, it will start decreasing after 1 sec.
	if (fighter1.draw_hp2==true)
	{
	    alarm[0]=room_speed;
		fighter1.draw_hp2=false;
	}

	if (fighter2.draw_hp2==true)
	{
	    alarm[1]=room_speed;
		fighter2.draw_hp2=false;
	}
}

//ENDING FIGHT

if(destroy_fighters)
{
    destroy_fighters=false;
	instance_destroy(fighter1);
	instance_destroy(fighter2);
	fighters_created=false;	
	
}