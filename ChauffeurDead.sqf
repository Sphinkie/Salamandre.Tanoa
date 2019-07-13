// ------------------------------------------------------------------
// Chauffeur is dead: mission is nearly completed
// ------------------------------------------------------------------


sleep 2;

// if the colonel is still alive:
if (alive officer) then
	{
	// The officer get out of the car
	unassignVehicle officer;
	officer action ["Getout", officercar];
	sleep 1;

	// The officer says: please dont shoot
	officer setCaptive true;
	officer setRandomLip true;
	officer say "officer01";
	officer setRandomLip false;
	sleep 10;

	// The officer join the group
	[officer] joinSilent (group player);
	officer setRandomLip true;
	officer say "officer02";
	(group player) setSpeedMode "NORMAL";
	officer setRandomLip false;

	// Task is complete
	call FNC_completeTask_3;
	sleep 15;

	// Spotter join the group
	spotter sideRadio "spotterRadio05";
	[spotter] join (group player);
	spotter move (getMarkerPos "marker_lz");
	};
	
