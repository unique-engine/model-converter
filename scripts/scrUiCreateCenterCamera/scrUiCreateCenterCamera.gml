function scrUiCreateCenterCamera(){
	uiBtnCenterCamera = new UiButton(uiXCurrent, winH - 32 - 20, 32, 32);
	uiXCurrent += 32 + 20;
	
	with (uiBtnCenterCamera.state) {
		sprite = sprIconCenterCamera;
		
		on_click = function() {
			with (oCtrl) {
				x = 16;
				y = 48;
				z = 37;
				direction = 119;
				zdir = 20;
				cameraXT = -5;
				cameraYT = 6;
				cameraZT = 0;
			}
		};
	}
	
	uiTooltipBtnCenterCamera = scrUiAddTooltip(uiBtnCenterCamera, "Reset the camera to the initial position");
}