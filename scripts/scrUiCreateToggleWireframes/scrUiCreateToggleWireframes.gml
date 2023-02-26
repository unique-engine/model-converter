function scrUiCreateToggleWireframes() {
	var uiCheckImportReverseTriangles = new UiCheckbox(uiX, uiYCurrent, 250, 20);
	
	with (uiCheckImportReverseTriangles.state) {
		text = "Wireframe";
		checked = oCtrl.settings.model.wireframe;
	
		on_click = function() {
			oCtrl.settings.model.wireframe = !oCtrl.settings.model.wireframe;
		};
	};
}