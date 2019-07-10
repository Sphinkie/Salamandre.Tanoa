// ----------------------------------------------------------------------------------------------------------
// Starting Script launched by init.sqf
// ----------------------------------------------------------------------------------------------------------
waitUntil { !isNil {player} };
waitUntil { player == player };

// ----------------------------------------------------------------------------------------------------------
// Section "Briefing"
// ----------------------------------------------------------------------------------------------------------
player createDiaryRecord ["Diary", ["Credits", "Mission réalisée par Sphinkie."]];
player createDiaryRecord ["Diary", ["Civilians", "No civilian casualties are allowed."]];
player createDiaryRecord ["Diary", ["Spotter", "A member of the commando (callsign 'spotter') is located on a highly placed location. He will give you all necessary information by radio. When you have the prisonner, he will join you at the evacuation point."]];
player createDiaryRecord ["Diary", ["Target", "Our target is a valuable high rank officer. He is volunteer to join us, but this must look like a kidnapping. After a meeting, the officer is going from <marker name='marker_harcourt'>Harcourt</marker> to <marker name='marker_airport'>St-George Airport</marker>. Our action will take place <marker name='marker_chkpt'>on this road</marker>."]];
player createDiaryRecord ["Diary", ["Villages", "Expect small ennemy presence in many villages of Saint-George island."]];
player createDiaryRecord ["Diary", ["St-George Island", "We are at <marker name='marker_tanoa'>Tanoa Airport</marker> on Tanoa Island. The ennemy controls St-George Island."]];

// ----------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------
player createDiarySubject ["contexte","Context"];
player createDiaryRecord  ["contexte", ["Stategy", "Favorisez l'attaque en tenailles..."]];
player createDiaryRecord  ["contexte", ["Gameplay", "The map is a just a map: so neither you, neither the ennemy will appear on it... (but, don't worry, you will receive enough information to find your objectives)"]];
player createDiaryRecord  ["contexte", ["Mission", "CSAT Colonel Fahim wants to join our side. We will simulate an ambush, eliminate his escort, and bring him to Tanoa.<br /><img image='fahim.jpg' />"]];

// ----------------------------------------------------------------------------------------------------------
// Task creation
// ----------------------------------------------------------------------------------------------------------

call FNC_createTask_0;
call FNC_createTask_1;
call FNC_createTask_2;
call FNC_createTask_3;
call FNC_createTask_4;
call FNC_createTask_5;

// ----------------------------------------------------------------------------------------------------------
// We have a car, with two units (chauffeur and officer)
// ----------------------------------------------------------------------------------------------------------
chauffeur  assignAsDriver officercar;
officer    assignAsCargo  officercar;
[chauffeur, officer] orderGetIn true;

// ----------------------------------------------------------------------------------------------------------
// Create a trigger to detect the death of the officer (the trigger is attached to the unit officer)
// ----------------------------------------------------------------------------------------------------------
_trg_1 = createTrigger ["EmptyDetector", getPos officer];
_trg_1 setTriggerArea [10, 10, 0, false, 10];
_trg_1 setTriggerActivation ["EAST", "PRESENT", false];
_trg_1 setTriggerStatements ["!alive officer", "call FNC_failTask_2;", ""];

// ----------------------------------------------------------------------------------------------------------
// Create a trigger for autosave around Moddergat
// ----------------------------------------------------------------------------------------------------------
_trg_2 = createTrigger ["EmptyDetector", getMarkerPos "marker_moddergat"];
_trg_2 setTriggerArea [300, 300, 0, false, 10];
_trg_2 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
_trg_2 setTriggerStatements ["this", "savegame;", ""];

// ----------------------------------------------------------------------------------------------------------
// Create a trigger to detect the death of the chauffeur
// ----------------------------------------------------------------------------------------------------------
_trg_3 = createTrigger ["EmptyDetector", getPos chauffeur];
_trg_3 setTriggerArea [10, 10, 0, false, 10];
_trg_3 setTriggerActivation ["EAST", "PRESENT", false];
_trg_3 setTriggerStatements ["!alive chauffeur", "call FNC_completeTask_3", ""];
//_trg_3 setTriggerStatements ["!alive chauffeur", "null = []execVM ""ChauffeurDead.sqf""; ", ""];


