// Resize Grid
var dgrid = ds_depth_grid;
var inst_num = instance_number(prnt_depth_object);
ds_grid_resize(dgrid,2,inst_num);

//Add instances info to grid
var yy = 0;
with(prnt_depth_object)
{
	dgrid[# 0,yy] = id;
	dgrid[# 1,yy] = y;
	yy++;
	
}

//Sort grid in ascending order
ds_grid_sort(dgrid,1,true);

//Loop through all of the instances in the grid and draw them
yy = 0;
var inst;
repeat(inst_num)
{
	//Pull out an id
	inst = dgrid[# 0, yy];
	
	with(inst)
	{
		event_perform(ev_draw,0);
	}
	yy++;
}
