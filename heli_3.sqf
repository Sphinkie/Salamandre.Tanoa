// ----------------------------------------------------------------------------------------------------------
// heli passing dropping zone
// ----------------------------------------------------------------------------------------------------------

// Jump order
heli vehicleChat "Jerks! Your turn! Go! Go! Go!";
playSound "pilot04";

// Our friend throw another IR beacon
friend forceWeaponFire ["IRGrenade","IRGrenade"];