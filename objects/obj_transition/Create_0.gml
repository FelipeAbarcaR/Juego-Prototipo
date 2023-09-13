/// @description Enumeracion + Configuracion

//enum TRANS_TYPE
//{
//	SLIDE,
//	FADE,
//	PUSH,
//	STAR,
//	WIPE
//}

width = global.res.guiwidth
height = global.res.guiheight;
//el +20 es para que cuando haga la transicion se ciere ocurezca por completo la pantalla por un segundo mas o menos
heightHalf = (height *0.5) + 20;
percent = 0;
leading = OUT;

//fight options
background=-1;
enemy=-1;

OUT=0;
IN=1;