// ----------------------------------------------------------------------------------------------------------
// Officer car #3 reachs the Checkpoint
// car speed must be set to 'limited'
// ----------------------------------------------------------------------------------------------------------


// Si la barriere est encore fermee, la voiture attend quelques secondes
if not (barriereOpen) then sleep 15;

// La voiture avance jusqu'a la barrière
_waypoint1 = officerGroup addWaypoint [getPos barriere,0];
_waypoint1 setWaypointType "MOVE";

// La voiture à l'aerodrome et l'officier en sort
_waypoint2 = officerGroup addWaypoint [getMarkerPos "marker_airport",0];
_waypoint2 setWaypointType "GETOUT";

