// ----------------------------------------------------------------------------------------------------------
// Radio order Alpha
// ----------------------------------------------------------------------------------------------------------
// hint "trg_alpha";

heli vehicleChat "Just a second. We have another passenger.";
playSound "pilot01";

spotter assignAsCargo heli;
[spotter] orderGetIn true;

