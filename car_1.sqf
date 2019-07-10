// ----------------------------------------------------------------------------------------------------------
// Civil car #1 reachs the Checkpoint
// car speed must be set to 'limited'
// ----------------------------------------------------------------------------------------------------------
// hint "Civil car #1 reachs the Checkpoint";

// Si la barrière est encore fermée, la voiture attend quelques secondes
if not (barriereOpen) then sleep 20;

// La voiture avance jusqu'à la barrière
_newWaypoint = civilgroup_1 addWaypoint [position barriere,0];
_newWaypoint setWaypointType "GETIN";

sleep 1;
// civildriver_1 assignAsDriver civilcar_1;
civilgroup_1 move position barriere;

// civilgroup_1 addWaypoint [getMarkerPos "marker_chkpt",0];
// civilgroup_1 move getMarkerPos "marker_chkpt";

sleep 5;
// La voiture va en ville
civilgroup_1 addWaypoint [getMarkerPos "marker_car1dest",0];

