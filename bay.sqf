// ----------------------------------------------------------------------------------------------------------
// Fahim has reached the exit of the bay alive
// ----------------------------------------------------------------------------------------------------------
// hint "trg_bay";


if (vehicle player == vehicle officer) then
	{
	// Officer is with the player: task done
	call FNC_completeTask_5;
	} else
	{
	// Officer is not with the player: task failed
	call FNC_failTask_5;
	}

