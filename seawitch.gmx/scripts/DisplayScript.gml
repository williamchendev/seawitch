Fullscreen = keyboard_check_pressed(vk_f11);
Scaling = keyboard_check_pressed(vk_f10);
screenw = display_get_width();
screenh = display_get_height();
gamew = 480;
gameh = 270;
scalew = screenw div gamew;
scaleh = screenh div gameh;

if (!vsync){
    display_reset(0, true);
    vsync = true;
    display_set_gui_size(gamew * 2, gameh * 2);
    surface_resize(application_surface, gamew * 2, gameh * 2);
}

if (window_get_fullscreen() != true) && (Fullscreen){
    window_set_fullscreen(true);
}
else if (window_get_fullscreen()) && (Fullscreen){
    window_center();
    window_set_fullscreen(false);
}

if (Scaling and (window_get_fullscreen() != true)){
    if (scale == 4){
        scale = 2;
    }
    else{
        scale++;
    }
    window_set_size(scale * gamew, scale * gameh);
    display_set_gui_size(gamew * 2, gameh * 2);
    surface_resize(application_surface, gamew * 2, gameh * 2);
    alarm[0] = 1;
}
