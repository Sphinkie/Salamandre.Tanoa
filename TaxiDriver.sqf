// ------------------------------------------------------------------
// The army driver salute and go away.
// ------------------------------------------------------------------

taxiDriver sideChat "Good luck !";
taxiDriver playAction "salute";
sleep 3;	
taxiDriver assignAsDriver taxi;
[taxiDriver] orderGetIn true;

sleep 5;
"task_heli" call BIS_fnc_taskSetCurrent;

sleep 5;
taxiDriver move getMarkerPos "marker_lifou";

sleep 10;
cutText ["Call radio 0-0 when you are ready for take off.", "PLAIN"];
