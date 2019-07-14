// -----------------------------------------------------
// talking with friend at LZ
// -----------------------------------------------------


friend setRandomLip true;
friend say "friend01";
sleep 2;
friend switchMove "HubBriefing_pointLeft";
friend say "friend02";
sleep 4;
friend say "friend03";
sleep 3;
friend setRandomLip false;
sleep 6;
friend call BIS_fnc_ambientAnim__terminate;
sleep 2;

// friend goes away (with the car, if he can)
friend assignAsDriver friendCar;
friend move getMarkerPos "marker_moddergat";
fanal2 hideObject true;
