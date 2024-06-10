// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_distribucion_n(_value,_media,_desv,_scale=undefined){
	
	var _x,_y,_m,_de;
	
	_x=_value;
	_de=_desv;
	_m=_media;
	
	_y=(1/(_de*sqrt(2*pi)))*exp(-0.5*power(((_x-_m)/_de),2))*_scale; 

	return _y;
}