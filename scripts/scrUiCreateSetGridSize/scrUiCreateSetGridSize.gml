function scrUiCreateSetGridSize() {
	uiYCurrent += 40;
	uiBtnSetGridSize = new UiButton(uiX, uiYCurrent - 10, 105, 30);
	
	with (uiBtnSetGridSize.state) {
		text = "Grid size: 32";
		padding_horizontal = 20;
		padding_vertical = 9;
		
		on_click = function() {
			with (oCtrl) {
				if (uiDialogShowing) return;
				uiDialogGridSize = get_integer_async("Set the new grid size", settings.camera.gridSize)				
				uiDialogShowing = true;
			}			
		};
	};
	
	var tooltip = scrUiAddTooltip(uiBtnSetGridSize, "Set the grid size");
	tooltip.set({ y: tooltip.state.y + 20 });
}