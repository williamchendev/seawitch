//Creates item pickup floating text
draw_set_font(Font04);
with(instance_create(oPlayer.x - round(string_width(argument1 + argument0) / 2), oPlayer.y - 18, oTextFloat)){
    text = argument1 + argument0;
}
