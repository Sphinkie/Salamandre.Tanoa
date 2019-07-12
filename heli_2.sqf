// ----------------------------------------------------------------------------------------------------------
// heli approach dropping zone
// ----------------------------------------------------------------------------------------------------------

heli vehicleChat "Get ready for Jump !";
playSound "pilot02";
sleep 5;

// Open the doors
heli animateDoor ["door_R",1];
sleep 4;

heli animateDoor ["door_L",1];
heli vehicleChat "Spotter! It's your turn! Jump!";
playSound "pilot03";
sleep 2;

unassignVehicle spotter;
spotter setPos (getMarkerPos "marker_spotter");
sleep 2;
heli animateDoor ["door_L",0];


