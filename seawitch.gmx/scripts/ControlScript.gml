
/**
if (gamepad_is_connected(0)){
    AXISH = gamepad_axis_value(0, gp_axislh);
    AXISV = gamepad_axis_value(0, gp_axislv);
    SENSITIVITY = 0.85;
    UPKey = gamepad_button_check(0, gp_padu) or (AXISV > SENSITIVITY);
    LEFTKey = (gamepad_button_check(0, gp_padl) or (AXISH < (-1 * SENSITIVITY))) * -1;
    RIGHTKey = gamepad_button_check(0, gp_padr) or (AXISH > SENSITIVITY);
    DOWNKey = gamepad_button_check(0, gp_padd) or (AXISV < (-1 * SENSITIVITY));
    HEAL = gamepad_button_check(0, gp_face4);
    HEALCHECK = gamepad_button_check_pressed(0, gp_face4);
    ROLL = gamepad_button_check(0, gp_face2);
    ITEMS = gamepad_button_check_pressed(0, gp_shoulderl);
    RUN = gamepad_button_check(0, gp_shoulderr);
    JUMP = gamepad_button_check_pressed(0, gp_face1);
    ATTACK = gamepad_button_check(0, gp_face3);
    ENTERKey = gamepad_button_check_pressed(0, gp_face1);
    ESCAPE = gamepad_button_check(0, gp_start);
}
else {
    
}
*/
rollkey = ord("C");
attackkey = ord("X");
jumpkey = ord("Z");
healkey = ord("S");
runkey = vk_shift;
inventorykey = ord("A");
exitkey = vk_escape;

UPKey = keyboard_check(vk_up);
LEFTKey = (keyboard_check(vk_left)) * -1;
RIGHTKey = keyboard_check(vk_right);
DOWNKey = keyboard_check(vk_down);
HEAL = keyboard_check(healkey);
HEALCHECK = keyboard_check(healkey);
ROLL = keyboard_check(rollkey);
ROLLRelease = keyboard_check_released(rollkey);
ITEMS = keyboard_check(inventorykey);
RUN = keyboard_check(runkey);
JUMP = keyboard_check(jumpkey);
ATTACK = keyboard_check(attackkey);
ATTACKRelease = keyboard_check_released(attackkey);
ENTERKey = keyboard_check_pressed(jumpkey);
ESCAPE = keyboard_check_pressed(exitkey);
UPKeyPress = keyboard_check_pressed(vk_up);
LEFTKeyPress = keyboard_check_pressed(vk_left);
RIGHTKeyPress = keyboard_check_pressed(vk_right);
DOWNKeyPress = keyboard_check_pressed(vk_down);

TESTKey = keyboard_check_pressed(ord('F'));
CLICK = mouse_check_button_pressed(mb_left);
