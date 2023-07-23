/// @description hola


fighter1=obj_Conde;
fighter2=global.fightEnemy;

marginw=140;
marginh=50;

//HP decreasing animation
decreasing=false;
decreasing2=false;
decrease_value=0.01;
width_value=1;
width_value2=1;

background=global.fightBackground;
draw_background=false;

bg_width=global.res.width;
bg_height=global.res.height;


FightTransitionStart(global.fightBackground,sqFightFadeOut,sqFightFadeIn);