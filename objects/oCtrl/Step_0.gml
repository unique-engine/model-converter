winW = window_get_width();
winH = window_get_height();
camViewMat = camera_get_view_mat(view_camera[0]);
camProjMat = camera_get_proj_mat(view_camera[0]);

scrHandleInput();

// Detect the window resize event
if (winW != 0 && winH != 0 && (winW != winOldW || winH != winOldH)) {
	surface_resize(application_surface, winW, winH);
	display_set_gui_size(winW, winH);
	
	var uiCurrentY = winH - 32 - 20;
	uiBtnCenterCamera.set({ y: uiCurrentY });
	uiTooltipBtnCenterCamera.move();
	
	uiBtnCameraSpeed.set({ y: uiCurrentY });
	uiTooltipBtnCameraSpeed.move();
}

ui_step();