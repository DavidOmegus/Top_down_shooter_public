draw_self();

if image_xscale > 1 or image_yscale > 1 {draw_sprite_ext(spr_brilho_tiro,0,x+.5,y+.5,.4,.4,image_angle,cor,.5);}
if image_xscale <= 1 or image_yscale <= 1 {draw_sprite_ext(spr_brilho_tiro,0,x+.5,y+.5,.2,.2,image_angle,cor,.5);}