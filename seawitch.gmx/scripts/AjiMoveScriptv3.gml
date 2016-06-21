//* Aji Move Script v3 *//

//Settings
walkspeed = 1;
runspeed = 2;
move = 0;
frictionstrength = 0.05;
jumpstrength = 5;
gravitystrength = 1;
gravityskip = 2;

//Keys
AKey = keyboard_check(ord('A'));
WKey = keyboard_check(ord('W'));
DKey = keyboard_check(ord('D'));
SKey = keyboard_check(ord('S'));
FKey = keyboard_check_pressed(ord('F'));
Shift = keyboard_check(vk_shift);

//Sprites
if (place_free(x, y + 2.01))
{
    sprite_index = sAji_Jump;
    if (vspeed > 0){
        image_index = 2;
        jumping = true;
    }
    else if (vspeed == 0){
        image_index = 1;
    }
    else if (vspeed < 0){
        image_index = 0;
    }
    image_speed = 0;
}
else if (stopping){
    sprite_index = sAji_Stop;
    image_speed = 0.3;
}
else if ((AKey or DKey) and ((AKey and DKey) == false)){
    if (running){
        sprite_index = sAji_Walk_Staff;
    }
    else {
        sprite_index = sAji_Walk;
    }
    image_speed = 0.3;
}
else if (((!AKey and !DKey) or (AKey and DKey)) and !WKey){
    if (!stopping and !running){
        sprite_index = sAji_Idle;
    }
    image_speed = 0.3;
}

//Movement
if (stopping){
    if (hspeed != 0){
        hspeed -= frictionstrength * sign(hspeed);
    }
    else {
        stopping = false;
        move = 0;
    }
}
if (!stopping){
    if (AKey and !DKey and hspeed <= 0){
        if (Shift and !running){
            running = true;
            move = -1;
        }
        if (running and (move == -1)){
            hspeed = -1 * runspeed;
            image_xscale = -1;
        }
        else if (!running and move == 0){
            hspeed = walkspeed * -1;
            image_xscale = -1;
        }
    }
    else if (DKey and !AKey and hspeed >= 0){
        if (Shift and !running){
            running = true;
            move = 1;
        }
        if (running and (move == 1)){
            hspeed = 1 * runspeed;
            image_xscale = 1;
        }
        else if (!running and move == 0){
            hspeed = walkspeed * 1;
            image_xscale = 1;
        }
    }
    else {
        if (running){
            running = false;
            stopping = true;
        }
        else {
            hspeed = 0;
        }
    }   
}

//Jumping
if (WKey and !jumping and place_free(x, y - 1)) {
    vspeed -= jumpstrength;
    jumping = true;
    gravitydelay = 0;
}

//Horizontal Collision
if (!place_free(x + hspeed + sign(hspeed), y)) {
    yplus = 0;
    while (!place_free(x + hspeed, y - yplus) && yplus <= abs(hspeed)){
        yplus += 1;
    }
    if (!place_free(x + hspeed, y - yplus))
    {
        while (place_free(x + sign(hspeed), y)){
            x += sign(hspeed);
        }
        var temp = 0;
        if (sign(hspeed) == -1){
            temp = 180;
        }
        else if (sign(hspeed) >= 0){
            temp = 0;
        }
        move_contact_solid(temp, abs(hspeed));
        hspeed = 0;
        move = 0;
        running = false;
    }
    else
    {
        y -= yplus;
    }
}

//Verticle Collisions
if (!place_free(x, y + vspeed)) {
    if (vspeed < 0) {
        move_contact_solid(90, abs(vspeed));
    }
    if (vspeed >= 0) {
        move_contact_solid(270, abs(vspeed));
        gravity = 0; 
        gravity_direction = 270; 
    }
    vspeed = 0;
    jumping = false;
}

//Gravity
if (place_free(x,y + 1)) { 
    if (gravitydelay = 0){
        gravity = gravitystrength; 
        gravity_direction = 270;
        gravitydelay++;
    }
    else if (gravitydelay = gravityskip){
        gravitydelay = 0;
    }
    else{
        gravitydelay++;
        gravity = 0; 
        gravity_direction = 270;
    }
}

//View
if ((x - (view_wview / 2)) <= 0){
    view_xview[0] = 0;
}
else if ((x + (view_wview / 2)) >= room_width){
    view_xview[0] = room_width - view_wview;
}
else{
    view_xview[0] = x - (view_wview / 2);
}

//Movement Script
//jumping = false;
//stopping = false;
//stopdirection = 0;
//running = false;
//gravitydelay = 0;
//canmove = true;

