x = oAji.x + movex;
y = oAji.y + ydisplace;

hspeed = oAji.hspeed;
vspeed = oAji.vspeed;

if (direct = 0){
    movex += spd;
}
else if (direct = 1){
    movex -= spd;
}

if (x > oAji.x + 20){
    direct = 1;
    depth = 5;
}
else if (x < oAji.x - 20){
    direct = 0;
    depth = -5;
}

if (x > oAji.x + 15){
    spd = 1;
}
else if (x < oAji.x - 15){
    spd = 1;
}
else if (x >= oAji.x - 15) and (x <= oAji.x + 15){
    spd = originspd;
}
