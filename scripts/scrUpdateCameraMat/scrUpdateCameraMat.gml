/** 
 * Update the view matrix of the camera
 */
function scrUpdateCameraMat() {
	cameraXT = oCtrl.x + dcos(oCtrl.direction) * dcos(-oCtrl.zdir);
	cameraYT = oCtrl.y + dsin(oCtrl.direction) * -dcos(-oCtrl.zdir);
	cameraZT = oCtrl.z - dsin(oCtrl.zdir);
	
	camera_set_view_mat(view_camera[0], matrix_build_lookat(
		oCtrl.x, oCtrl.y, oCtrl.z,  // From
		cameraXT, cameraYT, cameraZT, // To
		0, 0, 1 // Up
	));
}