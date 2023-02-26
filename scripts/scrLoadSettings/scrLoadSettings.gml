function scrLoadSettings() {
	settings = {
		camera: {
			grid: true,
			gridSize: 32,
			culling: cull_counterclockwise,
			speed: 1
		},
		
		model: {
			wireframe: false
		}
	};

	gpu_set_cullmode(settings.camera.culling);
}