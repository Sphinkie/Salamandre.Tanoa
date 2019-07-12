// ----------------------------------------------------------------------------------------------------------
// All guards at Checkpoint have been eliminated
// ----------------------------------------------------------------------------------------------------------

// Task is complete.
call FNC_completeTask_2;

sleep 20;
// Spotter send a message, and car #1 start coming
spotter sideRadio "spotterRadio02";
variableActivationCar1 = true;


sleep 90;
// Spotter send a message, and car #2 start coming
spotter sideRadio "spotterRadio03";
variableActivationCar2 = true;


sleep 90;
// Spotter send a message, and car #3 start coming (officer car)
spotter sideRadio "spotterRadio04";
// We position the car at its starting point
_p1 = getMarkerPos "marker_officer";
officercar setVehiclePosition[_p1,[],0];
// variableActivationCar3 = true;
// We create the WP for the car
_wp1 = officerGroup addWaypoint [getMarkerPos "marker_stop", 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointStatements ["true", "null = []execVM 'car_3.sqf'"];
