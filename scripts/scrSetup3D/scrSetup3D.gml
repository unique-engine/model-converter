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
	cameraFov = 60;
	cameraSpeed = 1;
	
	// Mouse
	winMouseX = 0;
	winMouseY = 0;
	winOldMouseX = 0;
	winOldMouseY = 0;
	winOldW = 0;
	winOldH = 0;
	winRadius = 0;
	device_mouse_dbclick_enable(false);

	// Setup the 3D camera
	gpu_set_zwriteenable(true);
	gpu_set_ztestenable(true);
	gpu_set_texrepeat(true);
	gpu_set_alphatestenable(true);
	gpu_set_tex_filter(true);
	gpu_set_tex_mip_enable(true);
	var projMat = matrix_build_projection_perspective_fov(-cameraFov, -(view_wport[1] / view_hport[1]), .01, 64000);
	camera_set_proj_mat(view_camera[1], projMat);
	camera_set_update_script(view_camera[1], scrUpdateCameraMat);
	
	// Grid
	scrModelBuildGrid(); 
	
	// Model data
	assimpImporter = new AssimpImporter();
	model = undefined;
	modelUnfrozen = undefined;
	modelName = undefined;
	
	// Light
	light = new UniqueMesh(undefined, false);
	light.vbuff = scrModelBuildSphere(c_yellow);
	light.yrot = 45;	
	light.z = 30;
	light.transform();
	
	//lightCone = scrModelBuildCone(10, 20, 4);
	//lightCone.yrot = light.yrot;	
	//lightCone.z = light.z;
	//lightCone.transform();
	
	// Skybox
	vbSkybox = scrModelBuildSkybox();
	skyboxTex = sprite_get_texture(sprSkybox, 0);
}