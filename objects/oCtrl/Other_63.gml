var dialogId = async_load[? "id"];
if (!uiDialogShowing) exit;

var resetDialog = function() {
	uiDialogShowing = false;
	uiDialogGridSize = undefined;
	uiDialogCameraSpeed = undefined;
}

if (async_load[? "status"]) {
	var value = async_load[? "value"];
	
	switch (dialogId) {
		case uiDialogGridSize:
			var size = clamp(round(value), 1, 32000);
			settings.camera.gridSize = size;
			vertex_delete_buffer(vbGrid);
			scrModelBuildGrid(size);
			uiBtnSetGridSize.set_text(string("Grid size: {0}", settings.camera.gridSize));
		break;
	
		case uiDialogCameraSpeed:
			settings.camera.speed = clamp(value, 0.01, 100);
		break;
	}
}

resetDialog();