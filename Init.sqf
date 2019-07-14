// ---------------------------------------------------------
// This file is run by Arma3 at the START
// ---------------------------------------------------------

// ---------------------------------------------------------
// On rend les markers invisibles sur la carte
// ---------------------------------------------------------
"marker_TZ"        setMarkerAlpha 0;
"marker_bay"       setMarkerAlpha 0;
"marker_chkpt"     setMarkerAlpha 0;
"marker_airport"   setMarkerAlpha 0;
"marker_moddergat" setMarkerAlpha 0;
"marker_car1dest"  setMarkerAlpha 0;
"marker_car2dest"  setMarkerAlpha 0;
"marker_harcourt"  setMarkerAlpha 0;
"marker_tanoa"     setMarkerAlpha 0;
"marker_lifou"     setMarkerAlpha 0;
"marker_officer"   setMarkerAlpha 0;
"marker_spotter"   setMarkerAlpha 0;
"marker_stop"      setMarkerAlpha 0;
 
fanal1     hideObject true;
// fanal2     hideObject true;

variableActivationCar1 = false;
variableActivationCar2 = false;
variableActivationCar3 = false;

spotter setName["Spotter","Spotter","Spotter"];

// ---------------------------------------------------------
// Début de la mission
// ---------------------------------------------------------
execVM "customFunctions.sqf"
execVM "Briefing.sqf";