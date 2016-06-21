//* Aji Move Script v8 *//

//Settings
walkspeed = 1;
runspeed = 2;
frictionstrength = 0.1;
jumpstrength = 1.5;
jumpdecay = 0.70;
jumpskip = 2;
gravitystrength = 1;
gravityskip = 5;

//Keys
ControlScript();
move = (LEFTKey + RIGHTKey);

//Sprites
if (canmove or instance_exists(oText)){
    if (instance_exists(oText)){
        move = 0;
        image_speed = 0;
    }
    if (place_free(x, y + 2.01))
    {
        sprite_index = sAji_Jump;
        if (vspd > 0.3){
            image_index = 2;
            jumping = true;
        }
        else if (vspd < -0.3){
            image_index = 0;
        }
        else{
            image_index = 1;
        }
        image_speed = 0;
    }
    else if (stopping and hspd != 0){
        sprite_index = sAji_Stop;
        image_speed = 0.3;
    }
    else if (move == 0){
        if (!stopping and !running){
            sprite_index = sAji_Idle;
        }
        image_speed = 0.3;
    }
    else if (move != 0){
        if (running and Endurance > 0){
            sprite_index = sAji_Run;
        }
        else {
            sprite_index = sAji_Walk;
        }
        image_speed = 0.3;
    }
}
else {
    if (sprite_index != sAji_Drink and sprite_index != sAji_Roll){
        image_speed = 0;
    }
    if (gui){
        image_speed = 0;
        if (place_free(x, y + 2.01))
        {
            sprite_index = sAji_Jump;
            if (vspd > 0.3){
                image_index = 2;
                jumping = true;
            }
            else if (vspd < -0.3){
                image_index = 0;
            }
            else{
                image_index = 1;
            }
        }
        else {
            sprite_index = sAji_Idle;
        }
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
        }
    }
    if (!stopping){
        if (move != 0){
            if (RUN and !running){
                running = true;
            }
            else if (!RUN and running){
                running = false;
            }
            if (running and Endurance > 0){
                hspd = move * runspeed;
            }
            else if (!running or Endurance <= 0){
                hspd = move * walkspeed;
                if (Endurance <= 0){
                    stopping = false;
                }
            }
            image_xscale = move;
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
    if (JUMP and place_free(x, y - 2) and jumping != true) {
        jumping = true;
        jspd = jumpstrength;
        vspd -= round(jspd);
        jspd = jspd * jumpdecay;
        jumpdelay = 0;
        gravitydelay = 0;
    }
    else if (JUMP and vspd < 0) {
        if (jumpdelay = 0){
            vspd -= round(jspd);
            jspd = jspd * jumpdecay;
            jumpdelay++;
        }
        else if (jumpdelay == jumpskip){
            jumpdelay = 0;
        }
        else {
            jumpdelay++;
        }
    }
    else if (JUMP != true){
        jspd = 0;
    }
}
else {
    if (rolling != true){
        if (hspd != 0){
            hspd -= frictionstrength * sign(hspd);
        }
        else {
            stopping = false;
        }
    }
}

//Gravity
if (vspd < 10) { 
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
    if(!place_free(x, y + 1)){
        while (!place_free(x + hspd, y - yplus) && yplus <= abs(hspd)){
            yplus += 1;
        }
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
    if (!place_free(x, y + 1)){
        if (JUMP != true){
            jumping = false;
        }
    }
    vspd = 0;
}

y += vspd;

if (place_free(x, y + sign(vspd))){
    
}

//View
CameraMovement();

background_x = view_xview - (view_xview / 100);
background_y = view_yview;

//Movement Script
//stopping = false;
//stopdirection = 0;
//jumping = false;
//running = false;
//gravitydelay = 0;
//canmove = true;
//vspd = 0;
//hspd = 0;

if (ESCAPE){
    if (instance_exists(oExit) != true){
        instance_create(0, 0, oExit);
    }
}


if (TESTKey){
    var str;
    var numnumtest = 0;
    //irandom(4)
    switch (numnumtest)
    {
        case 0: str = "Hello my child I have the most important news to tell you.  We have found a very important thing to show you today as we are in the discovery phase of the importance of life child child understand goddamnit, Hello my child I have the most important news to tell you.  We have found a very important thing to show you today as we are in the discovery phase of the importance of life child child understand goddamnit";break;
        case 1: str = "I like potatos,#ham,#and chopsticks.";break;
        case 2: str = "Dumbly dumbly doo";break;
        case 3: str = "Potatos taste bad";break;
        case 4: str = "Grassssssssssssssssssssssssssss";break;
        default: str = "Something went wrong!";break;
    }
    TextBoxScript(str, 0, 1);
}

/**

if (TESTKey){
    room_goto(room3);   
}