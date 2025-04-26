if (view_current != 1) exit;
draw_set_color(c_white); draw_set_alpha(1);

// Draw the skybox
gpu_set_zwriteenable(false);
matrix_set(matrix_world, matrix_build(x, y, z, 100, 30, 0, 1, 1, 1));
vertex_submit(vbSkybox, pr_trianglelist, skyboxTex);
matrix_set(matrix_world, global.ue_matrix_identity);

// Draw the grid
if (settings.grid) {
	vertex_submit(vbGrid, pr_linelist, -1);
	gpu_set_zwriteenable(true);
	vertex_submit(vbGridLines, pr_trianglelist, -1);
}

// Draw the model
if (model != undefined) {	
	// @test Lighting
	shader_set(shLight);	
	
	if (model.children_length && model.children[0].material.textures[$ "diffuse"] != undefined) {
		var textureSampler = shader_get_sampler_index(shLight, "s_Texture");
		texture_set_stage(textureSampler, model.children[0].material.textures.diffuse);
	}
	
	var lightPosition = shader_get_uniform(shLight, "u_LightPosition");
	shader_set_uniform_f(lightPosition, light.x, light.y, light.z);
	
	var lightDirection = shader_get_uniform(shLight, "u_LightDirection");
	shader_set_uniform_f(lightDirection, light.xrot, light.yrot, light.zrot);

	var lightColor = shader_get_uniform(shLight, "u_LightColor");
	shader_set_uniform_f(lightColor, 0.8, 0.8, 0.8, 1.0);

	var ambientColor = shader_get_uniform(shLight, "u_AmbientColor");
	shader_set_uniform_f(ambientColor, 0.6, 0.6, 0.6, 1.0);

	var backlightColor = shader_get_uniform(shLight, "u_BacklightColor");
	shader_set_uniform_f(backlightColor, 0.3, 0.3, 0.9, 1.0);
	
	// Draw the model
	model.draw();
	shader_reset();

	// Draw the model bounding box (for debug purposes)
	if (modelBbox != undefined) vertex_delete_buffer(modelBbox);
	var bbox = model.bbox_relative;
	modelBbox = scrModelBuildParallelepiped(bbox.x1, bbox.y1, bbox.z1, bbox.x2, bbox.y2, bbox.z2);
	vertex_submit(modelBbox, pr_linelist, -1);
}

// Draw the lights placeholders
light.draw();
matrix_set(matrix_world, global.ue_matrix_identity);