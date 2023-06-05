/// @description

position= path_position;
if  (position == 0.5)
{
	global.enemy_atk = 1;
	global.enemy_hit = 0;
	path_speed = 64;

}
if (stance=="prepare" && position =1)
{
stance="attack"
}

if (stance == "wait")
{
	if (global.beat=true) bitcount++;
	if (bits==bitcount){
		 bitcount=0;
		 stance= "prepare";
		 scr_ataque1();
	}
}
if (stance == "attack"){
	if (global.beat=true) bitcount++;
	if (bits2==bitcount){
		bitcount=0;
		stance="attack"
		scr_ataque12();
}
	
}
if (stance=="end"){
	if (global.beat=true) bitcount++;
	if (bits2==bitcount){
		x = xstart;
		y = ystart;
		global.enemy_atk = false;
		global.enemy_hit = true;
		stance ="wait"
	/// @description "reset"
	}
}