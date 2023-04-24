function AttackSlash(){
	
	// Ataque recien empezo
	if(sprite_index != spr_player_attack_slash)
	{
		//configurar la animacion correcta
		sprite_index = spr_player_attack_slash;
		localframe = 0;
		image_index = 0;
		
		//Vaciar la lista de hit
		// si no hay nada en la lista de hit, crea la lista
		if(!ds_exists(hitbyattack, ds_type_list)) hitbyattack = ds_list_create();
		ds_list_clear(hitbyattack);
	}
	
	CalcAttack(spr_attack_slash_HB);
	
	//Update Sprite
	PlayerAnimateSprite();
	
	if(animationend)
	{
		state = PlayerStateFree;
		animationend = false;
	}

}
// usaremos para detectar el hit 
function CalcAttack (_maskindex){
	
	mask_index = _maskindex;
	
	var _hitbyattacknow = ds_list_create();
				// esta entrega una lista con toda las entidades envueltas en una colision
																//el ordered es un booleano que si es true ordenara los ID de los mas cercanos a los mas lejanos
	var _hits = instance_place_list(x,y,prnt_entity,_hitbyattacknow,false);
	if(_hits >0)
	{
		for(var i = 0; i<_hits; i++)
		{
			//si esta instancia todavia no a sido hiteada por el ataque, hiteala
						// [|i]con eso puede tratar la lista como un array
			var _hitID = _hitbyattacknow[| i];// ds_list_find_value (_hitbyattacknow,i) es lo mismo
			if(ds_list_find_index(hitbyattack,_hitID)==-1)
			{
				ds_list_add(hitbyattack,_hitID);
				with(_hitID)
				{
					//la funcion checkea si el primer objeto es parent del segundo
					//if(object_is_ancestor(object_index, obj_enemy))
					//{
						//id es el de la instancia (enemigo) y el other.id el del player
					//	HurtEnemy(id, 5, other.id, 10);
					//}
					//else
					if(EntityHitScript != -1) script_execute(EntityHitScript);
				}
			}
		}
	}
	ds_list_destroy(_hitbyattacknow);
	mask_index = spr_player;
}