function scrUiCreateExportModel() {
	uiXCurrent += 170;
	
	uiBtnExportModel = new UiButton(uiXCurrent, uiY, 150, 30);
	
	with (uiBtnExportModel.state) {
		text = "Export model";
		
		on_click = function() {
			var fname = get_save_filename("Unique Model (.unique)|*.unique", filename_change_ext(oCtrl.modelName, "") + ".unique");
			if (fname == "") return;
			oCtrl.modelUnfrozen.save(fname);
			
			var modelUniqName = filename_change_ext(string_length(oCtrl.modelName) > 25 ? string_copy(oCtrl.modelName, 1, 25) + ".." : oCtrl.modelName, ".unique");
			var modelUniqNameNoExt = filename_change_ext(string_length(oCtrl.modelName) > 25 ? string_copy(oCtrl.modelName, 1, 25) + ".." : oCtrl.modelName, "");
			
			clipboard_set_text(string(@'// Load the "{0}" model in the Create event
model = ue_model_load("{1}");

// Draw event
model.draw();', modelUniqNameNoExt, modelUniqName));

			oCtrl.uiNotificationElem.add_item(string("Model \"{0}\" exported." + chr(13) + chr(10) + "The model load code has been copied to your clipboard", modelUniqName));
		};
	};
	
	var tooltip = scrUiAddTooltip(uiBtnExportModel, "Export the model to a buffer file to quickly load it with Unique Engine");
	tooltip.set({ y: tooltip.state.y + 20 });
}