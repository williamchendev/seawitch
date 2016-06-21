if (place_meeting(x, y, oPlayer) and oPlayer.rolling != true){
    oPlayer.canmove = false;
    oPlayer.healing = false;
    oPlayer.running = false;
    oPlayer.stopping = false;
    oPlayer.sprite_index = sAji_Hurt;
    oPlayer.alarm[0] = stunlocktime;
    oPlayer.hit = true;
    if (oPlayer.x > x) and (place_free(oPlayer.x + hspeed + 1, oPlayer.y)){
        oPlayer.hspd = hitstrength;
    }else if (oPlayer.x < x) and (place_free(oPlayer.x - hspeed - 1, oPlayer.y)){
        oPlayer.hspd = -1 * hitstrength;
    }
    for(i = 0; i < damage; i++){
        if (instance_exists(oWaterCircle)){
            with(instance_nearest(x, y, oWaterCircle)){
                instance_destroy()
            }
        }
    }
    instance_destroy()
}

if (!place_free(x + hspeed, y + vspeed)){
    instance_destroy();
}
