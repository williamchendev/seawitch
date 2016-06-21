//* Aji Move Script v4 *//

//Settings
walkspeed = 1;
runspeed = 2;
move = 0;
frictionstrength = 0.05;
jumpstrength = 5;
gravitystrength = 1;
gravityskip = 2;

//Keys
WKey = keyboard_check(ord('W'));
AKey = keyboard_check(ord('A'));
DKey = keyboard_check(ord('D'));
SKey = keyboard_check(ord('S'));
FKey = keyboard_check_pressed(ord('F'));
Shift = keyboard_check(vk_shift);
Escape = keyboard_check_pressed(vk_escape);

//Sprites
if (canmove){
    if (place_free(x, y + 2.01))
    {
        sprite_index = sAji_Jump;
        if (vspd > 0){
            image_index = 2;
        }
        else if (vspd == 0){
            image_index = 1;
        }
        else if (vspd < 0){
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
}
else {
    if (sprite_index != sAji_Drink and sprite_index != sAji_Roll){
        image_speed = 0;
    }
}

//Movement
if (canmove){
    if (stopping){
        if (hspd != 0){
            hspd -= frictionstrength * sign(hspd);
        }
        else {
            stopping = false;
            move = 0;
        }
    }
    if (!stopping){
        if (AKey and !DKey and hspd <= 0){
            if (Shift and !running){
                running = true;
                move = -1;
            }
            if (running and (move == -1)){
                hspd = -1 * runspeed;
                image_xscale = -1;
            }
            else if (!running and move == 0){
                hspd = walkspeed * -1;
                image_xscale = -1;
            }
        }
        else if (DKey and !AKey and hspd >= 0){
            if (Shift and !running){
                running = true;
                move = 1;
            }
            if (running and (move == 1)){
                hspd = 1 * runspeed;
                image_xscale = 1;
            }
            else if (!running and move == 0){
                hspd = walkspeed * 1;
                image_xscale = 1;
            }
        }
        else {
            if (running){
                running = false;
                stopping = true;
            }
            else {
                hspd = 0;
            }
        }   
    }
    
    //Jumping
    if (!place_free(x, y + 1) and WKey and place_free(x, y - 2)) {
        vspd -= jumpstrength;
        gravitydelay = 0;
    }
}
else {
    if (rolling != true){
        if (hspd != 0){
            hspd -= frictionstrength * sign(hspd);
        }
        else {
            stopping = false;
            move = 0;
        }
    }
}

//Gravity
if (place_free(x,y + 1)) { 
    if (gravitydelay = 0){
        vspd += gravitystrength; 
        gravitydelay++;
    }
    else if (gravitydelay = gravityskip){
        gravitydelay = 0;
    }
    else{
        gravitydelay++;
        vpsd = 0; 
    }
}

//Horizontal Collision
if (!place_free(x + hspd, y)) {
    yplus = 0;
    while (!place_free(x + hspd, y - yplus) && yplus <= abs(hspd)){
        yplus += 1;
    }
    if (!place_free(x + hspd, y - yplus))
    {
        while (place_free(x + sign(hspd), y)){
            x += sign(hspd);
        }
        hspd = 0;
        move = 0;
        running = false;
    }
    else
    {
        y -= yplus;
    }
}

x += hspd;

//Verticle Collisions
if (!place_free(x, y + vspd)) {
    while(place_free(x, y + sign(vspd))){
        y += sign(vspd);
    }
    vspd = 0;
}

y += vspd;

//View
if ((x - (view_wview / 2)) <= 0){
    view_xview[0] = 0;
}
else if ((x + (view_wview / 2)) >= room_width){
    view_xview[0] = room_width - view_wview;
}
else{
    view_xview[0] = round(x) - (view_wview / 2);
}

//Movement Script
//stopping = false;
//stopdirection = 0;
//running = false;
//gravitydelay = 0;
//canmove = true;
//vspd = 0;
//hspd = 0;

if (Escape){
    if (instance_exists(oExit) != true){
        instance_create(0, 0, oExit);
    }
}
