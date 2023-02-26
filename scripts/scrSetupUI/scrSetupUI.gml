function scrSetupUI() {
	uiNotificationElem = new UiNotification(winW - 600, guiTopHeight + 10, 600 - 10, 300);
	
	uiX = 15;
	uiY = 10;
	uiXCurrent = uiX;
	scrUiCreateLoadModel();
	scrUiCreateExportModel();
	
	uiYCurrent = guiTopHeight + 20;
	scrUiCreateToggleWireframes();
	scrUiCreateShowGrid();
	scrUiCreateSetGridSize();
	scrUiCreateCullbackMode();
	
	uiXCurrent = 20 + guiLeftWidth;
	scrUiCreateCenterCamera();
	scrUiCreateCameraSpeed();
	
	uiNotificationElem.focus();
}