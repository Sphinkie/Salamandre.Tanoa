// ----------------------------------------------------------------------------------------------------------
// Starting Script launched by init.sqf
// ----------------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------------
// Creating the tasks
// ----------------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------------
// -- Methode des SimpleTask 'https://community.bistudio.com/wiki/Tasks:
// createSimpleTask ["Titre Menu briefing"];
// setSimpleTaskDescription ["Description de l'objectif", "Titre Menu briefing", "Titre marqueur carte"];
// setSimpleTaskDestination (getMarkerPos "CZ");
// Inconvenient: on ne sait pas après si la tache existe ou pas...
// ----------------------------------------------------------------------------------------------------------
// -- Methode des fonctions BIS:
// [...] call BIS_fnc_taskCreate;  			// owner,taskID,[description], destination, state, priority, showNotification, type
// [...] call BIS_fnc_taskSetDescription;  	// ["description", "title", "marker"]
// [...] call BIS_fnc_taskSetDestination;   // Affiche le marker de la destination sur la carte
// optionals: (par defaut, des notifications apparaissent déjà lorsqu'une tache est effectuée)
// ["TaskSucceeded",["","Rejoindre l'hélicoptère."]] call BIS_fnc_showNotification;
// ["TaskAssigned",["","Rejoignez la Landing Zone prévue."]] call BIS_fnc_showNotification;
// Example:
//    [player,"task_LZ",["","",""],objNull,"CREATED",4,true,"move"] call BIS_fnc_taskCreate;
// 	  ["task_LZ",["Regroup at the <marker name='marker_LZ'>Meeting Point</marker>.","Regroup at Meeting point","marker_LZ"]] call BIS_fnc_taskSetDescription;
//    ["task_LZ","marker_LZ"] call BIS_fnc_taskSetDestination;
//    player call BIS_fnc_tasksUnit;		// affiche la liste des taches
// La liste des TaskTypes est ici: https://community.bistudio.com/wiki/Arma_3_Tasks_Overhaul
// ----------------------------------------------------------------------------------------------------------
// -- Methode du fichier CFG:
//   Définir les descriptions CfgTaskDescriptions dans description.ext
//   Eventuellement, définir le type avec: ["task_1","move"] call BIS_fnc_taskSetType;
//   Assigner la tache avec: [player,"task_1",""] call BIS_fnc_taskCreate;
// ----------------------------------------------------------------------------------------------------------

FNC_createTask_0 = 
{
	[player,"task_heli",""] call BIS_fnc_taskCreate;    // Laisser la description vide pour utiliser CfgTaskDescriptions
	["task_heli","heli"] call BIS_fnc_taskSetType;
	["task_heli","marker_heli"] call BIS_fnc_taskSetDestination;
};

FNC_createTask_1 = 
{
	[player,"task_LZ",""] call BIS_fnc_taskCreate;
	["task_LZ","move"] call BIS_fnc_taskSetType;
	// Affichage des markers
	"marker_LZ" setMarkerAlpha 1;
};

FNC_createTask_2 = 
{
	[player,"task_chkpt",""] call BIS_fnc_taskCreate;
	["task_chkpt","attack"] call BIS_fnc_taskSetType;
};

FNC_createTask_3 = 
{
	[player,"task_capture",""] call BIS_fnc_taskCreate;
	["task_capture","kill"] call BIS_fnc_taskSetType;
};

FNC_createTask_4 = 
{
	[player,"task_boat",""] call BIS_fnc_taskCreate;
	["task_boat","boat"] call BIS_fnc_taskSetType;
	// Affichage des markers
	"marker_TZ" setMarkerAlpha 1;
};

FNC_createTask_5 = 
{
	[player,"task_evac",""] call BIS_fnc_taskCreate;
	["task_evac","exit"] call BIS_fnc_taskSetType;
};


/* Exemple de creation de SimpleTask:
	taskLandingZone = player createSimpleTask ["Rejoindre la LZ"];
	taskLandingZone setSimpleTaskDescription ["Rejoignez la <marker name='LZ'>LandingZone</marker>, et parlez à notre correspondant sur site. Il vous fournira des quads.","Rejoindre Landing Zone","Landing Zone"];
	taskLandingZone setTaskState "Created";
	taskLandingZone setSimpleTaskDestination (getMarkerPos "LZ"); 	// Affichage de l'objectif sur la carte.
	...
	player setCurrentTask taskLandingZone; 
*/


// ----------------------------------------------------------------------------------------------------------
// Fonctions pour la fin des taches.
// ----------------------------------------------------------------------------------------------------------

FNC_completeTask_0 =
{
	if (["task_heli"]  call BIS_fnc_taskExists) then { ["task_heli" ,"SUCCEEDED"] call BIS_fnc_taskSetState; };
	sleep 2;
	"task_LZ" call BIS_fnc_taskSetCurrent;
};

FNC_completeTask_1 =
{
	if (["task_lz"] call BIS_fnc_taskExists) then { ["task_lz" ,"SUCCEEDED"] call BIS_fnc_taskSetState; };
	sleep 2;
	"task_chkpt" call BIS_fnc_taskSetCurrent;
};

FNC_completeTask_2 =
{
	if (["task_chkpt"] call BIS_fnc_taskExists) then { ["task_chkpt" ,"SUCCEEDED"] call BIS_fnc_taskSetState; };
	"task_capture" call BIS_fnc_taskSetCurrent;
};

// For trigger "chauffeur !alive"
FNC_completeTask_3 =
{
	if (["task_capture"] call BIS_fnc_taskExists) then { ["task_capture" ,"SUCCEEDED"] call BIS_fnc_taskSetState; };
	"task_boat" call BIS_fnc_taskSetCurrent;
};

FNC_completeTask_4 =
{
	if (["task_boat"] call BIS_fnc_taskExists) then { ["task_boat" ,"SUCCEEDED"] call BIS_fnc_taskSetState; };
	"task_evac" call BIS_fnc_taskSetCurrent;
};

FNC_completeTask_5 =
{
	if (["task_evac"] call BIS_fnc_taskExists) then { ["task_evac" ,"SUCCEEDED"] call BIS_fnc_taskSetState; };
	["MISSION_SUCCESS", false] call BIS_fnc_endMission;
};

/*
FNC_taskCrashzone_Done =
{
	if (["taskCrashzone"] call BIS_fnc_taskExists) then { ["taskCrashzone" ,"SUCCEEDED"] call BIS_fnc_taskSetState;};
	sleep 3;
	// Tache suivante: évacuation.  (On  crée la tache si elle n'existe pas).
	if !(["taskEvac"] call BIS_fnc_taskExists)
	then {
		hint "Task created";
		call FNC_taskEvac;
		};
	"taskEvac" call BIS_fnc_taskSetCurrent;
	["taskEvac","Depot"] call BIS_fnc_taskSetDestination; 	// Affichage de l'objectif sur la carte.
	// on donne une description plus précise.
	["taskEvac", 
	  ["Ramenez les Quads au <marker name='Depot'>dépot</marker>, récupérez l'<marker name='LZ'>hélicoptère</marker> et retournez à la <marker name='TC'>base</marker>",
	  "Ramener les survivants.","Evac"]] call BIS_fnc_taskSetDescription;

	"Depot" setMarkerAlpha 1;
};


FNC_taskEvac_Done =
{
	if (["taskEvac"] call BIS_fnc_taskExists) then { ["taskEvac" ,"SUCCEEDED"] call BIS_fnc_taskSetState;};
};

*/

// ----------------------------------------------------------------------------------------------------------
// Functions for critical task failure.
// ----------------------------------------------------------------------------------------------------------
// For trigger "officer @ airport"
FNC_failTask_1 =
{
	if (["task_capture"] call BIS_fnc_taskExists) then { ["task_capture" ,"FAILED"] call BIS_fnc_taskSetState; };
	["FAILURE_1", false] call BIS_fnc_endMission;
};

// For trigger "officer !alive"
FNC_failTask_2 =
{
	if (["task_capture"] call BIS_fnc_taskExists) then { ["task_capture" ,"FAILED"] call BIS_fnc_taskSetState; };
	["FAILURE_2", false] call BIS_fnc_endMission;
};

FNC_failTask_5 =
{
	if (["task_evac"] call BIS_fnc_taskExists) then { ["task_evac" ,"FAILED"] call BIS_fnc_taskSetState; };
	["FAILURE_3", false] call BIS_fnc_endMission;
};

// ----------------------------------------------------------------------------------------------------------
// Debug function
// ----------------------------------------------------------------------------------------------------------
FNC_kill =
{
	// kill all units at checkpoint
	{
		_x setDamage 1;
	} forEach (list trg_chkpt);
}
