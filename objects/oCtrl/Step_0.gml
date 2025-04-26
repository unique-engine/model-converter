winW = window_get_width();
winH = window_get_height();
camProjMat = camera_get_proj_mat(view_camera[1]);
camViewMat = camera_get_view_mat(view_camera[1]);

// Detect the window resize event
if (winW != 0 && winH != 0 && (winW != winOldW || winH != winOldH)) {
	surface_resize(application_surface, winW, winH);
	display_set_gui_size(winW, winH);
	
	camera_set_view_size(view_camera[0], winW, winH);
	view_set_wport(0, winW);
	view_set_hport(0, winH);
	
	camera_set_view_size(view_camera[1], winW-600, winH-50);
	view_set_wport(1, winW-600);
	view_set_hport(1, winH-50);
	camProjMat = matrix_build_projection_perspective_fov(-cameraFov, -(view_wport[1] / view_hport[1]), .01, 64000);
	camera_set_proj_mat(view_camera[1], camProjMat);
}

scrHandleInput();

// @debug
if (keyboard_check_released(ord("1"))) {
	scrActionLoadModel();	
}

if (keyboard_check(vk_left)) {
	light.x -=  dsin(direction) * cameraSpeed;
	light.y -= dcos(direction) * cameraSpeed;
}
if (keyboard_check(vk_right)) {
	light.x += dsin(direction) * cameraSpeed;
	light.y += dcos(direction) * cameraSpeed;
}
if (keyboard_check(vk_up)) {
	light.x += dcos(direction) * dcos(zdir) * cameraSpeed;
    light.y += -dsin(direction) * dcos(zdir) * cameraSpeed;
}
if (keyboard_check(vk_down)) {
	light.x -= dcos(direction) * cameraSpeed;
    light.y -= -dsin(direction) * cameraSpeed;
}

light.transform();
// end debug