function scrLoadSettings() {
	settings = {
		grid: true,
		culling: cull_noculling,
		//culling: cull_counterclockwise,
		wireframe: false
	};

	gpu_set_cullmode(settings.culling);
}