//Settings
rollspeed = 2.5;

//HitStun
if (alarm[0] == 0) and (hit){
    alarm[0] = -1;
    canmove = true;
    hit = false;
    hspd = 0;
}

//Canteen
if (HEALCHECK) and (healing != true) and (canmove) and (sprite_index != sAji_Drink) and (Canteens != 0){
    healing = true;
}

if (HEAL) and (healing){
    canmove = false;
    running = false;
    stopping = false;
    image_speed = 0.3;
    sprite_index = sAji_Drink;
}
else if (HEAL != true) and (healing) and !(image_index > 17){
    sprite_index = sAji_Idle;
    healing = false;
    canmove = true;
}

if (sprite_index == sAji_Drink) and (image_index > 17) and (healing){
    for(i = 0; i < 40; i++){
        pointx = irandom_range(-18, 18) + x;
        pointy = irandom_range(-18, 18) + y;
        with(instance_create(pointx, pointy, oWaterPoint)){
            direction = point_direction(oAji.x, oAji.y, x, y) + 180;
            returnto = false;
            alarm[0] = 15;
            speed = 2;
        }
    }
    healing = false;
    Canteens--;
}
else if (sprite_index == sAji_Drink) and (image_index > 25){
    canmove = true;
}

//Dodge Roll
if (ROLL and rolling != true and canmove and Endurance > 30){
    rollmove = sign(image_xscale);
    rolling = true;
    canmove = false;
    running = false;
    stopping = false;
    image_speed = 0.3;
    sprite_index = sAji_Roll;
    image_index = 0;
    Endurance -= 30;
}

if (image_index < 15 and sprite_index == sAji_Roll){
    hspd = rollspeed * rollmove;
}
else if (image_index >= 15 and sprite_index == sAji_Roll){
    rollmove = 0;
    rolling = false;
    canmove = true;
    hspd = sign(hspd) * 1;
    stopping = true;
}

//Endurance Costs
if (running and Endurance > 0){
    if (place_free(x, y + 1)){
        Endurance -= (EnduCost * 0.6);
    }
    else {
        Endurance -= EnduCost;
    }
}
else if (running and Endurance <= 0){
    Endurance = 0;
}

if (fatigue and Endurance > 30){
    fatigue = false;
    stopping = false;
    canmove = true;
}

if (Endurance < MaxEndu and !running and !rolling and !healing){
    if (abs(MaxEndu - Endurance) < 2){
        Endurance = MaxEndu;
    }
    else{
        Endurance += EnduRecover;
    }
}else if (Endurance > MaxEndu){
    Endurance -= 2;
}

//Initialized Variables
//healing = false;
