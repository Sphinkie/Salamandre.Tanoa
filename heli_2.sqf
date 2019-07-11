// ----------------------------------------------------------------------------------------------------------
// heli approach dropping zone
// ----------------------------------------------------------------------------------------------------------

heli vehicleChat "Get ready for Jump !";

// Open the doors
sleep 5;
heli animateDoor ["door_R",1];

sleep 4;
heli animateDoor ["door_L",1];
heli vehicleChat "Spotter! It's your turn! Jump!";
sleep 2;
unassignVehicle spotter;
spotter setPos (getMarkerPos "marker_spotter");
sleep 2;
heli animateDoor ["door_L",0];


