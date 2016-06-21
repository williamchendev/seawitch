//Movement Script
image_speed = .3;
gravitystrength = .3;
jumpheight = 5;
runspeed = .2;
xcollision = 3;
imagescale = 1;

//Keys
AKey = keyboard_check(ord('A'));
WKey = keyboard_check(ord('W'));
DKey = keyboard_check(ord('D'));
SKey = keyboard_check(ord('S'));
FKey = keyboard_check_pressed(ord('F'));
Shift = keyboard_check(vk_shift);

//Friction
if (hspeed != 0){
    if (hspeed > 0){
        if (!place_free(x + xcollision + hspeed, y)){
            move_contact_solid(0, hspeed);
            hspeed = 0;
        }
        else{
            hspeed -= .05;
        }
    }
    if (hspeed < 0){
        if (!place_free(x + hspeed - xcollision, y)){
            move_contact_solid(180, -hspeed);
            hspeed = 0;
        }
        else{
            hspeed += .05;
        }
    }
}
else{
    running = false;
}

//Movement
if (AKey) && place_free(x - xcollision, y){
    if (Shift){
        if (hspeed > -2.5){
            if (!place_free(x - xcollision, y)){
                move_contact_solid(180, 100);
            }else{
                hspeed -= runspeed;
            }
        }
        if (jumping = false){
            sprite_index = sAji_Walk_Staff;
        }
        running = true;
    }
    else if ((running = false) && place_free(x - xcollision, y)){
        x--;
        if (jumping = false){
            sprite_index = sAji_Walk;
        }
    }
    image_xscale = -1 * imagescale;
    
    if ((Shift = false) && (running = true)){
        if (jumping = false){
            sprite_index = sAji_Stop;
        }
    }
}
else if (DKey) && place_free(x + xcollision, y){
    if (Shift){
        if (hspeed < 2.5){
            if (!place_free(x + xcollision, y)){
                move_contact_solid(0, hspeed);
            }else{
                hspeed += runspeed;
            }
        }
        if (jumping = false){
            sprite_index = sAji_Walk_Staff;
        }
        running = true;
    }
    else if ((running = false) && place_free(x + xcollision, y)){
        x++;
        if (jumping = false){
            sprite_index = sAji_Walk;
        }
    }
    image_xscale = 1 * imagescale;
    
    if ((Shift = false) && (running = true)){
        if (jumping = false){
            sprite_index = sAji_Stop;
        }
    }
}
else{
    if (jumping = true){
        sprite_index = sprite13;
    }
    else if (hspeed != 0){
        if (jumping = false){
            sprite_index = sAji_Stop;
        }
    }
    else{
        sprite_index = sAji_Idle;
    }
}

//Collisions
if (!place_free(x, y + vspeed + 1)) && (vspeed > 0){
    move_contact_solid(270, vspeed);
    gravity = 0.0; 
    gravity_direction = 270; 
    vspeed = 0;
}
else if (!place_free(x, y + vspeed + 1)) && (vspeed = 0){
    move_contact_solid(270, 0);
    jumping = false;
}
else if (!place_free(x, y + vspeed)) && (vspeed < 0){
    move_contact_solid(90, vspeed);
    vspeed = 0;
}
else if place_free(x,y) { 
    gravity = gravitystrength; 
    gravity_direction = 270; 
}

if (WKey) && (!place_free(x , y + 2)){
    vspeed =- jumpheight;
    jumping = true;
    sprite_index = sprite13;
}
