// -----------------------------------------------------
// talking with friend at LZ
// -----------------------------------------------------

friend setRandomLip true;
friend say "friend01";
friend setRandomLip false;

sleep 15;

// friend goes away (sometimes with the car)
friend assignAsDriver friendCar;
friend move getMarkerPos "marker_moddergat";
fanal2 hideObject true;
