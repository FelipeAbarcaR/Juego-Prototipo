// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function scr_FightEnemyMove(){

var _xTo,_yTo;

var _control=obj_fight_control;

//get the coordinates of the point to go
var _current_path_x = path_get_point_x(current_path,point_to_go);
var _current_path_y = path_get_point_y(current_path,point_to_go);
//scale to screen resolution
var _fight_room_width = 1024; //width of path's canvas
var _fight_room_height = 576; //height of path's canvas
var _point_x=map_value(_current_path_x,0,_fight_room_width,0,global.res.width);
var _point_y=map_value(_current_path_y,0,_fight_room_height,0,global.res.height);

_xTo=_control.x+ _point_x;
_yTo=_control.y+_point_y;

//get the distances between points and the distance from object to target point
var _distance,_actualdistance;

_distance=point_distance(xi,yi,_xTo,_yTo);
_actualdistance=point_distance(x,y,_xTo,_yTo);

var _BPM,_time,_speed,_direction;

//set speed based on bpm
_BPM = obj_beat.current_bpm;
_time = ((60/_BPM)*room_speed);
var _multiplier=2;
if (stance=EnemyStance.postattack) _multiplier=10;
_speed = (_distance/_time)*_multiplier; //x times the original speed
_direction= point_direction(x,y,_xTo,_yTo);

//move the object to the point
if(_actualdistance<=_speed)
{
	//if the speed you are moving moves you further from point, then land on point
	x=_xTo;
	y=_yTo;
}else
{
	//else... then move to the point
	x+=lengthdir_x(_speed,_direction);
	y+=lengthdir_y(_speed,_direction);
	
}


_actualdistance=point_distance(x,y,_xTo,_yTo);

//play sfx at 90% distance
if ((_actualdistance/_distance)>=0.90 && played_sfx==false)
{
	Fightplay_sfx(EnemyStance.prepare);
	played_sfx=true;
}

if(_actualdistance==0||_distance==0)
{
	played_sfx=false;

	var _numpoints=path_get_number(current_path)-1;
	
	if(point_to_go==_numpoints)//if reached the end point of the path
	{
		if(stance=EnemyStance.postattack)
		{
			attacking=false;
			stance=EnemyStance.endstance;
			StartEndState=true;
		}

		if(stance=EnemyStance.attack)
		{
			//if reached the end of points while attacking, then start the shaky thing in post-attack stance
			stance=EnemyStance.postattack;
			//create and set a new random path
			current_path=pathrandom();
			prepare_wait_beats=0;
			point_to_go=0;
			xi=x;
			yi=y;
		}
		
		//if reached the last point preparing attack, attack stance
		if(stance=EnemyStance.prepare){
				
			stance=EnemyStance.attack;
			ShowFXArrows();
		}
		

	} else
	{
		xi=x;
		yi=y;
		point_to_go++;
		return true;
	}
}else return false;

}

function pathrandom()
{
    var _path = path_add();
	var _obj=obj_fight_control;
	
	//starting position on screen
	var _x=x-_obj.x;
	var _y=y-_obj.y;

	var _fight_room_width = 1024; //width of path's canvas
	var _fight_room_height = 576; //height of path's canvas

	//scale this new coordinates to path's canvas (arreglar a que sea 480x270)
	var _point_x=map_value(_x,0,global.res.width,0,_fight_room_width);
	var _point_y=map_value(_y,0,global.res.height,0,_fight_room_height);

	var _range = 60;
	var _x_random,_y_random;

	for(var i=0;i<3;i++)
	{
		_x_random=floor(random(1)*_range)-(_range/2);
		_y_random=floor(random(1)*_range)-(_range)/2;
		
		//add a new random point close to actual position
	    path_add_point(_path,_point_x+_x_random,_point_y+_y_random,100);
	}
	//add final point on the same starting point
	path_add_point(_path,_point_x,_point_y,100);
	return _path;
	
}

