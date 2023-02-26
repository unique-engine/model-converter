function scrUiCreateCameraSpeed() {
	uiBtnCameraSpeed = new UiButton(uiXCurrent, winH - 32 - 20, 32, 32);
	
	with (uiBtnCameraSpeed.state) {
		sprite = sprIconCamera;
		
		on_click = function() {
			with (oCtrl) {
				if (uiDialogShowing) return;
				uiDialogCameraSpeed = get_integer_async("Set the camera speed (move, elevation and zoom). It does not affect the camera rotation and panning", settings.camera.speed)				
				uiDialogShowing = true;
			}
		};
	}
	
	uiTooltipBtnCameraSpeed = scrUiAddTooltip(uiBtnCameraSpeed, "Set the camera speed (move, elevation and zoom). It does not affect the camera rotation and panning");
}