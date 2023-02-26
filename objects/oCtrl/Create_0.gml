model_version = "1.0";
guiTopHeight = 50;
guiLeftWidth = 250;
guiLeftY = guiTopHeight + 1;
cursorSprite = undefined;
debug = false;
showControls = false;

uiDialogShowing = false;
uiDialogGridSize = undefined;
uiDialogCameraSpeed = undefined;

winW = window_get_width();
winH = window_get_height();
scrLoadSettings();
scrSetupUI();
scrSetup3D();
display_reset(4, false);

// Maximize the window
alarm[0] = 3; 