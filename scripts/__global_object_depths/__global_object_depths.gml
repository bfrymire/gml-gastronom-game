function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = -1; // obj_controller
	global.__objectDepths[1] = 0; // obj_char_select
	global.__objectDepths[2] = 0; // obj_gm48
	global.__objectDepths[3] = 0; // obj_wall
	global.__objectDepths[4] = 1; // obj_player
	global.__objectDepths[5] = 0; // obj_enemy
	global.__objectDepths[6] = 0; // obj_bullet
	global.__objectDepths[7] = 0; // obj_casing
	global.__objectDepths[8] = 0; // obj_controller_enemy
	global.__objectDepths[9] = 0; // obj_init
	global.__objectDepths[10] = 0; // sys_transition
	global.__objectDepths[11] = -1; // imported_obj_controller
	global.__objectDepths[12] = 0; // obj_controller_endless
	global.__objectDepths[13] = 0; // obj_controller_dodge
	global.__objectDepths[14] = 0; // obj_flesh
	global.__objectDepths[15] = 0; // obj_spawner
	global.__objectDepths[16] = 0; // obj_start
	global.__objectDepths[17] = 0; // obj_rate
	global.__objectDepths[18] = 0; // obj_retry
	global.__objectDepths[19] = 0; // obj_quit
	global.__objectDepths[20] = 0; // obj_target
	global.__objectDepths[21] = 0; // obj_combat_text
	global.__objectDepths[22] = -1; // obj_main_menu


	global.__objectNames[0] = "obj_controller";
	global.__objectNames[1] = "obj_char_select";
	global.__objectNames[2] = "obj_gm48";
	global.__objectNames[3] = "obj_wall";
	global.__objectNames[4] = "obj_player";
	global.__objectNames[5] = "obj_enemy";
	global.__objectNames[6] = "obj_bullet";
	global.__objectNames[7] = "obj_casing";
	global.__objectNames[8] = "obj_controller_enemy";
	global.__objectNames[9] = "obj_init";
	global.__objectNames[10] = "sys_transition";
	global.__objectNames[11] = "imported_obj_controller";
	global.__objectNames[12] = "obj_controller_endless";
	global.__objectNames[13] = "obj_controller_dodge";
	global.__objectNames[14] = "obj_flesh";
	global.__objectNames[15] = "obj_spawner";
	global.__objectNames[16] = "obj_start";
	global.__objectNames[17] = "obj_rate";
	global.__objectNames[18] = "obj_retry";
	global.__objectNames[19] = "obj_quit";
	global.__objectNames[20] = "obj_target";
	global.__objectNames[21] = "obj_combat_text";
	global.__objectNames[22] = "obj_main_menu";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
