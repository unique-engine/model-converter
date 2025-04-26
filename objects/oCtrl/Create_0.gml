cursorSprite = undefined;
debug = false;
showControls = false;
camViewMat = undefined;
camProjMat = undefined;
modelBbox = undefined;
winW = window_get_width();
winH = window_get_height();
display_set_gui_size(winW, winH);
scrLoadSettings();
scrSetupUI();
scrSetup3D();
display_reset(8, false);

// Maximize the window
call_later(3, time_source_units_frames, function() {
	window_command_run(window_command_maximize);
});