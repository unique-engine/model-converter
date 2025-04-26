/** 
 * Update the view matrix of the camera
 */
function scrUpdateCameraMat() {
	var cameraXT = oCtrl.x + dcos(oCtrl.direction) * dcos(-oCtrl.zdir);
	var cameraYT = oCtrl.y + dsin(oCtrl.direction) * -dcos(-oCtrl.zdir);
	var cameraZT = oCtrl.z - dsin(oCtrl.zdir);
	
	camera_set_view_mat(view_camera[1], matrix_build_lookat(
		oCtrl.x, oCtrl.y, oCtrl.z,  // From
		cameraXT, cameraYT, cameraZT, // To
		0, 0, 1 // Up
	));
}