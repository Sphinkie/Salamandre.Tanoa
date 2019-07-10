// ----------------------------------------------------------------------------------------------------------
// helicopter
// ----------------------------------------------------------------------------------------------------------

// heli allowed to land
heli flyInHeightASL [0, 100, 500];

// close the door
heli animateDoor ["door_R",0];

// Our friend throw another IR beacon
friend forceWeaponFire ["IRGrenade","IRGrenade"];