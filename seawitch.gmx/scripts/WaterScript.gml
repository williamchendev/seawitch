TestKey = keyboard_check_pressed(ord('U'));
WaterCount = instance_number(oWaterCircle);

if (TestKey) && (WaterCount < 101){

    with(instance_create(oAji.x, oAji.y, oWaterCircle)){
        spd = random_range(1, 2.3);
        originspd = spd;
        pace = 0;
    }

}

if (WaterCount > 100){
    for (i = 0; i < WaterCount - 100; i++){
        with(instance_nearest(x, y, oWaterCircle)) {
            instance_destroy();
        }
    }
}
