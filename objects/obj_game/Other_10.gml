/// @description Create inventory interface

//Dimensions
var _margin = 10;
var _sep = 4;
var _cellSize = 24;

//Inventory items
var _sizeX = 6; //vamos a tener 6 botones del ancho 
var _sizeY = 2; // y dos de alto

//Coordinates
var _invX = _margin;												//el mas 30 es porque si
var _invY = global.res.height - (_margin + _sep + _cellSize + _sizeY + 30);

var _x = 0;
var _y = 0;

for(var i = 0; i < INV_SIZE ; i++)
{
	var _buttonX = _invX + (_sep + _cellSize) * _x;
	var _buttonY = _invY + (_sep + _cellSize) * _y;
	
	var _button = instance_create_depth(_buttonX,_buttonY,0,obj_button_inv);
	
	//Set properties
	with(_button)
	{
		slotID = i;
		button_witdh = _cellSize;
		button_height = _cellSize;	
	}
	
	//Move position
	_x++;
	
	if(_x == _sizeX)
	{
		_x = 0;
		_y++;	
	}
}

