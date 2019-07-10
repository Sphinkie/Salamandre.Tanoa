// ----------------------------------------------------------------------------------------------------------
// Civil car #2 reachs the Checkpoint
// car speed must be set to 'limited'
// ----------------------------------------------------------------------------------------------------------
// hint "Civil car #2 reachs the Checkpoint";

// Si la barrière est encore fermée, la voiture attend quelques secondes
if not (barriereOpen) then sleep 15;

// La voiture avance jusqu'à la barrière
_newWaypoint = civilgroup_2 addWaypoint [getPos barriere,0];
_newWaypoint setWaypointType "MOVE";

// La voiture va en ville
civilgroup_2 addWaypoint [getMarkerPos "marker_car2dest",0];

