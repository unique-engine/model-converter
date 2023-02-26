function scrUiCreateLoadModel() {
	var uiBtnLoadModel = new UiButton(uiXCurrent, uiY, 150, 30);
	
	with (uiBtnLoadModel.state) {
		text = "Load model";
		
		on_click = function() {
			var fname = get_open_filename("3D Model (.obj, .3ds, .dae, .fbx, .blend)|*.obj;*.3ds;*.dae;*.fbx;*.blend", "");
			window_set_cursor(cr_default);
			if (fname == "") exit;
			
			with (oCtrl) {
				if (model) {
					model.destroy();
					modelUnfrozen.destroy();
				}
				
				var timer = get_timer();
				model = assimpImporter.import(fname);
				modelUnfrozen = model.clone();
				model.freeze();
				var timerEnd = string("{0} ms", (get_timer() - timer)/1000);
				
				modelName = filename_name(fname);
				window_set_caption(modelName + " - Unique Model Converter");
				uiNotificationElem.add_item(string("Model \"{0}\" loaded in {1}", string_length(modelName) > 25 ? string_copy(modelName, 1, 25) + ".." : modelName, timerEnd));
			}
		};
	};
	
	var tooltip = scrUiAddTooltip(uiBtnLoadModel, "Load a 3D model");
	tooltip.set({ y: tooltip.state.y + 20 });
}