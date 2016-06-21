//* AjiMoveInit *//

//Movement Script
stopping = false;
running = false;
jumping = false;
canmove = true;
gravitydelay = 0;
jumpdelay = 0;
jspd = 3;
vspd = 0;
hspd = 0;

//Movement Plus
healing = false;
hit = false;
rolling = false;
dead = false;
fatigue = false;

gui = false;

//Stats
MaxEndu = 100;
EnduCost = 0.5;
EnduRecover = 0.8;
Endurance = 100;
Canteens = 5;

//Camera
cutscene = false;
regionx = 0;
regiony = 0;

//GUI and Instances
instance_create(0, 0, oDisplay);
instance_create(0, 0, oAjiGUI);
