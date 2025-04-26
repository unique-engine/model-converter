function scrActionLoadModel() {
	var fname = get_open_filename("3D Model (.obj, .3ds, .dae, .fbx, .blend, .ply, .stl)|*.obj;*.3ds;*.dae;*.fbx;*.blend;*.ply;*.stl", "");
	window_set_cursor(cr_default);
	if (string_trim(fname) == "") return;
			
	with (oCtrl) {
		if (model) {
			model.destroy();
			//modelUnfrozen.destroy();
		}
				
		var timer = get_timer();
		model = assimpImporter.import(fname);
		if (!model) return;
		//modelUnfrozen = model.clone();
		model.freeze();
		var timerEnd = string("{0} ms", (get_timer() - timer)/1000);
				
		modelName = filename_name(fname);
		window_set_caption(modelName + " - Unique Engine");
		//uiNotificationElem.add_item(string("Model \"{0}\" loaded in {1}", string_length(modelName) > 25 ? string_copy(modelName, 1, 25) + ".." : modelName, timerEnd));
		
		// Set the camera position at the right distance/direction from the model
		var bbox = model.bbox_relative;
		var center_x = (bbox.x1 + bbox.x2)/2;
		var center_y = (bbox.y1 + bbox.y2)/2;
		var center_z = (bbox.z1 + bbox.z2)/2;
		
		var size_x = bbox.x_size;
		var size_y = bbox.y_size;
		var size_z = bbox.z_size;
		cameraSpeed = sqrt(sqr(size_x) + sqr(size_y) + sqr(size_z)) * .005;
		
		x = max(1, center_x + size_x * 2);
		y = max(1, center_y + size_y / 1.5);
		z = max(1, center_z + size_z * 1.5);
		
		light.x = size_x + 5;
		light.y = size_y + 5;
		light.z = center_z + size_z;
		light.destroy();
		light.vbuff = scrModelBuildSphere(c_yellow, max(0.02, sqrt(sqr(size_x) + sqr(size_y) + sqr(size_z)) * .01));
		
		// Calculate the direction of the angle towards the model
		direction = point_direction(x, y, center_x, center_y) / 1.1;
		var distance_xy = point_distance(x, y, center_x, center_y);
		zdir = darctan((z - center_z) / distance_xy) / 2;
	}
}