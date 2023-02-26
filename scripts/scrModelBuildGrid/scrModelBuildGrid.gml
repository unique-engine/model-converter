function scrModelBuildGrid(dist = 32) {
	vbGrid = vertex_create_buffer();
	vertex_begin(vbGrid, vforPosCol);
	
	var alpha;
	var size = 32000;
	var xcount = ceil(size*2/dist);
	var ycount = ceil(size*2/dist);

	for (var i=0; i<xcount; i++) {
		if (i % 10 == 0) { alpha = .8; } else { alpha = .4; }
		
		// Horizontal
		vertex_position_3d(vbGrid, -size+i*dist, -size, 0);
		vertex_color(vbGrid, c_gray, alpha);
		vertex_position_3d(vbGrid, -size+i*dist, size, 0);
		vertex_color(vbGrid, c_gray, alpha);
	}
	
	for (var i=0; i<ycount; i++) {
		if (i % 10 == 0) { alpha = .8; } else { alpha = .4; }
		
		// Vertical
		vertex_position_3d(vbGrid, -size, -size+i*dist, 0);
		vertex_color(vbGrid, c_gray, alpha);
		vertex_position_3d(vbGrid, size, -size+i*dist, 0);
		vertex_color(vbGrid, c_gray, alpha);
	}
	
	/**
	 * Create a line mesh
	 */
	var scrModelBuildLine = function(vbuff, x1, y1, z1, x2, y2, z2, col, alpha) {
		vertex_position_3d(vbuff, x1, y1, z1);
		vertex_color(vbuff, col, alpha);
	
		vertex_position_3d(vbuff, x2, y2, z2);
		vertex_color(vbuff, col, alpha);
	}

	// Create the root center lines
	scrModelBuildLine(vbGrid, -size, 0, 0, size, 0, 0, Colors3D.x, 1);
    scrModelBuildLine(vbGrid, 0, -size, 0, 0, size, 0, Colors3D.y, 1);
	scrModelBuildLine(vbGrid, 0, 0, -size, 0, 0, size, Colors3D.z, 1);
	
	vertex_end(vbGrid);
	vertex_freeze(vbGrid);
}