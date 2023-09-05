draw_sprite(spr_slide_button,0,x,y);
draw_sprite(spr_slide_bar,0,slide_bar_pos_x,y);
draw_text(slide_bar_pos_x + slide_bar_box_width + 12,y+6,string(round(slide_percentage*100)) + string("%"));
