function scrSetup3D() {
	enum Colors3D {
		x = $3a1be0, 
		y = $00b300,
		z = $e05402
	}

	x = 16;
	y = 48;
	z = 37;
	direction = 119;
	zdir = 20;
	cameraXT = -5;
	cameraYT = 6;
	cameraZT = 0;
	cameraFov = 60;
	cameraAspectRatio = view_get_wport(0) / view_get_hport(0);
	
	// Mouse
	winMouseX = 0;
	winMouseY = 0;
	winOldMouseX = 0;
	winOldMouseY = 0;
	winOldW = 0;
	winOldH = 0;
	device_mouse_dbclick_enable(false);

	// Setup the 3D camera
	gpu_set_zwriteenable(true);
	gpu_set_ztestenable(true);
	gpu_set_texrepeat(true);
	gpu_set_alphatestenable(true);
	gpu_set_tex_filter(true);
	gpu_set_tex_mip_enable(true);		
	camera = camera_create();
	
	var projMat = matrix_build_projection_perspective_fov(-cameraFov, -cameraAspectRatio, 1, 32000);
	camera_set_proj_mat(camera, projMat);
	view_enabled = true;
	view_set_camera(0, camera);
	camera_set_update_script(camera, scrUpdateCameraMat);
	
	// Grid
	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_color();
	vforPosCol = vertex_format_end();
	scrModelBuildGrid();
	
	// Model data
	assimpImporter = new AssimpImporter();
	model = undefined;
	modelUnfrozen = undefined;
	modelName = "cat";
		
	model = new UniqueModel();
	model.load("cat.unique");
	model.faces_count = 70576;
	model.triangles_count = 211728;
	model.vertices_count = 40717;
	model.materials_count = 1;
	modelUnfrozen = model.clone();
	model.freeze();
}