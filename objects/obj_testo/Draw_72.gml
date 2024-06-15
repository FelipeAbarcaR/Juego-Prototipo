/// @description Insert description here
// You can write your code in this editor

// Crear la surface
var _circular_surface = -1;
_circular_surface = surface_create(global.res.width,global.res.height);

// Establecer la surface como objetivo
surface_set_target(_circular_surface);

// Deshabilitar el blend y color write
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);

// Dibujar el fondo oscuro
draw_set_alpha(0);
draw_rectangle(0, 0, _width, _height, false);

// Dibujar el rectángulo redondeado
draw_set_alpha(1);
var _rounded = 15;
draw_roundrect_ext(0, 0, _width, _height, _rounded, _rounded, 0);

// Rehabilitar blend y color write
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true, true, true, true);

// Establecer el modo de mezcla para restar color y alfa
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
gpu_set_alphatestenable(true);

// Dibujar el sprite del cono de luz
draw_sprite(spr_lightcone, 0, 0, 0);

// Restaurar el modo de mezcla y alfa test
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);

// Restaurar el objetivo de dibujo
surface_reset_target();

// Dibujar la surface resultante en la pantalla o en otra superficie
draw_surface(_circular_surface, 0, 0);

// Liberar la surface si ya no es necesaria
surface_free(_circular_surface);


