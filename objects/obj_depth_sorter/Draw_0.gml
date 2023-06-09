//Resize Grid
var dsgrid = ds_depth_grid;

var inst_num = instance_number(prnt_depth);

ds_grid_resize(dsgrid,2,inst_num);

//Add instances info to grid
var yy = 0;
with(prnt_depth)
{
	dsgrid[# 0,yy] = id;
	dsgrid[# 1,yy] = y;
	yy++;
}

//Sort grid in ascending order
ds_grid_sort(dsgrid,1,true);

//Loop through the grid and draw all the instances
var inst;
yy = 0;
repeat(inst_num)
{	
	//puul out an ID
	inst = dsgrid[# 0, yy];
	//Get the instance to draw itself
	with(inst)
	{
		event_perform(ev_draw,0);
		
	}
	
	yy++;
}