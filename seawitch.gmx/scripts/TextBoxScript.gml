//* TextBoxScript(String, portrait, speed) *//

with(instance_create(x, y, oText)) {
    text = argument0;
    portrait = argument1;
    spd = argument2;
    font = RegularFont;
    
    xpadding = 0;
    ypadding = 0;
    maxlength = 300;
    boxlimit = maxlength * 3;
    
    length = string_length(text);
    font_size = font_get_size(font);
    fontspace = font_size + (font_size / 2);
    
    draw_set_font(font);
    
    text_width = string_width_ext(text, fontspace, maxlength);
    text_height = string_height_ext(text, fontspace, maxlength);
}
