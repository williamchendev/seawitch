/**/// Aji Movement Engine v2 ///**/

////////////
//Settings//
////////////
imagespd = 0.3;
runspeed = 2;
walkspeed = 1;
jumpstength = 5;
gravitystrength = 1;
gravityskip = 2;
frictionstrength = 0.05;

////////
//Keys//
////////
AKey = keyboard_check(ord('A'));
WKey = keyboard_check(ord('W'));
DKey = keyboard_check(ord('D'));
SKey = keyboard_check(ord('S'));
FKey = keyboard_check_pressed(ord('F'));
Shift = keyboard_check(vk_shift);
Escape = keyboard_check_pressed(vk_escape);

////////////
//Movement//
////////////

if (canmove){
    //Shift Running
    if (Shift) and (running = false){
        running = true;
    }
    
    //Walking & Running
    if (AKey) and (stopping == false) and (place_free(x - 1, y)){
        if (running) and (stopdirection == 0){
            stopdirection = -1;
        }
        if (running) and (stopdirection == -1){
            hspeed = -1 * runspeed;
            if (jumping == false){
                sprite_index = sAji_Walk_Staff;
            }
            image_xscale = -1;
        }
        else if (running = false) and (place_free(x - 1, y)){
            x -= walkspeed;
            if (jumping == false){
                sprite_index = sAji_Walk;
            }
            image_xscale = -1;
        }
    }
    else if (DKey) and (stopping == false) and (place_free(x + 1, y)){
        if (running) and (stopdirection == 0){
            stopdirection = 1;
        }
        if (running) and (stopdirection == 1){
            hspeed = runspeed;
            if (jumping == false){
                sprite_index = sAji_Walk_Staff;
            }
            image_xscale = 1;
        }
        else if (running = false) and (place_free(x + 1, y)){
            x += walkspeed;
            if (jumping == false){
                sprite_index = sAji_Walk;
            }
            image_xscale = 1;
        }
    }
    else{
        //Idle
        if (running){
            if (hspeed != 0){
                stopping = true;
                if (hspeed > 0){
                    hspeed -= frictionstrength;
                }
                else if (hspeed < 0){
                    hspeed += frictionstrength;
                }
                if (jumping == false){
                    sprite_index = sAji_Stop;
                }
            }
            else{
                hspeed = 0;
                frictionindex = 0;
                running = false;
                stopdirection = 0;
                stopping = false;
                if (jumping == false){
                    sprite_index = sAji_Idle;
                }
            }
        }
        else{
            hspeed = 0;
        }
        if (hspeed == 0) and (jumping == false){
            sprite_index = sAji_Idle;
        }
    }
    
    //Jumping
    if (WKey) and (jumping == false) and (place_free(x, y - 2)) and (stopping == false){
        vspeed -= jumpstength;
        gravitydelay = 0;
        jumping = true;
        sprite_index = sAji_Jump;
    }
    
    if (jumping == false){
        image_speed = imagespd;
    }
    else if (jumping){
        image_speed = 0;
        if (vspeed > 0){
            image_index = 2;
        }
        else if (vspeed == 0){
            image_index = 1;
        }
        else if (vspeed < 0){
            image_index = 0;
        }
    }
}
else{
    if (hspeed > 0){
        hspeed -= frictionstrength;
    }
    else if (hspeed < 0){
        hspeed += frictionstrength;
    }
}
//////////////
//Collisions//
//////////////

//Horizontal Collisions
if (!place_free(x + hspeed + stopdirection, y))
{   
    if (hspeed < 0){move_contact_solid(180, abs(hspeed));}
    if (hspeed >= 0){move_contact_solid(0, abs(hspeed));}
    hspeed = 0;
}
//Verticle Collisions
if (!place_free(x, y + vspeed))
{
    if (vspeed < 0) {
        move_contact_solid(90, abs(vspeed));
    }
    if (vspeed >= 0) {
        move_contact_solid(270, abs(vspeed));
        gravity = 0; 
        gravity_direction = 270; 
        jumping = false;
    }
    vspeed = 0;
}
//Catch Corner Collision
if (!place_free(x + hspeed + stopdirection, y + vspeed))
{
    hspeed = 0;
}

///////////
//Gravity//
///////////
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

////////
//View//
////////
if ((oAji.x - (view_wview / 2)) <= 0){
    view_xview[0] = 0;
}
else if ((oAji.x + (view_wview / 2)) >= room_width){
    view_xview[0] = room_width - view_wview;
}
else{
    view_xview[0] = oAji.x - (view_wview / 2);
}

//view_yview[0] = oAji.y + (view_hview / 2);

////////////////////
//Create Statement//
////////////////////

//jumping = false;
//running = false;
//stopping = false;
//stopdirection = 0;
//gravitydelay = 0;

if (Escape){
    if (instance_exists(oExit) != true){
        instance_create(0, 0, oExit);
    }
}
