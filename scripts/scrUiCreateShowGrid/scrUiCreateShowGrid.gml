function scrUiCreateShowGrid() {
	uiYCurrent += 30;
	
	var uiCheckEnableAntialiasing = new UiCheckbox(uiX, uiYCurrent, 250, 20);
	
	with (uiCheckEnableAntialiasing.state) {
		text = "Grid";
		checked = !!oCtrl.settings.camera.grid;
	
		on_click = function() {
			oCtrl.settings.camera.grid = !oCtrl.settings.camera.grid;
		};
	};
	
	scrUiAddTooltip(uiCheckEnableAntialiasing, "Toggle the grid visibility");
}