// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function scr_FightEnemyMove(){

var _xTo,_yTo;

var _control=obj_fight_control;

var _current_path_x = path_get_point_x(current_path,point_to_go);
var _current_path_y = path_get_point_y(current_path,point_to_go);
var _fight_room_width = 1024;
var _fight_room_height = 576;

var _point_x=map_value(_current_path_x,0,_fight_room_width,0,global.res.width);
var _point_y=map_value(_current_path_y,0,_fight_room_height,0,global.res.height);

_xTo=_control.x+ _point_x;
_yTo=_control.y+_point_y;

//
var _distance,_actualdistance;

_distance=point_distance(xi,yi,_xTo,_yTo);
_actualdistance=point_distance(x,y,_xTo,_yTo);

var _BPM,_time,_speed,_direction;

//set speed based on bpm
_BPM = obj_beat.current_bpm;
_time = ((60/_BPM)*room_speed);
_speed = (_distance/_time)*2;//twice of speed
_direction= point_direction(x,y,_xTo,_yTo);


if(_actualdistance<=_speed)
{
	x=_xTo;
	y=_yTo;
}else
{
	x+=lengthdir_x(_speed,_direction);
	y+=lengthdir_y(_speed,_direction);
	
}


_actualdistance=point_distance(x,y,_xTo,_yTo);

//play sfx at 90% distance
if ((_actualdistance/_distance)>=0.90 && played_sfx==false)
{
	PlaySFX(EnemyStance.prepare);
	played_sfx=true;
}

if(_actualdistance==0||_distance==0)
{
	played_sfx=false;
	//if reached the last point, attack stance
	var _numpoints=path_get_number(current_path)-1;
	if(point_to_go==_numpoints)
	{
		if(stance=EnemyStance.attack)
		{
			attacking=false;
			stance=EnemyStance.endstance;
			StartEndState=true;
		}		
		if(stance=EnemyStance.prepare){
			stance=EnemyStance.attack;
			ShowFXArrows()
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

