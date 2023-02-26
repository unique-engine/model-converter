// Draw the grid
if (settings.camera.grid) {
	vertex_submit(vbGrid, pr_linelist, -1);
}

// Draw the model
if (model != undefined) {
	model.draw(oCtrl.settings.model.wireframe);
}

matrix_set(matrix_world, global.ue_matrix_identity);