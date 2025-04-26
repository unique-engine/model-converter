/** @custom */
function scrModelBuildGrid(dist = 32) {
	vbGrid = vertex_create_buffer();
	vertex_begin(vbGrid, global.ue_vertex_format);
	
	var alpha;
	var size = 16000;
	var xcount = ceil(size*2/dist);
	var ycount = ceil(size*2/dist);

	for (var i=0; i<xcount; i++) {
		if (i % 10 == 0) { alpha = .8; } else { alpha = .4; }
		
		// Horizontal
		vertex_position_3d(vbGrid, -size+i*dist, -size, 0);
		vertex_normal(vbGrid, 0, 0, 0);
		vertex_texcoord(vbGrid, 0, 0);
		vertex_color(vbGrid, c_gray, alpha);
		
		vertex_position_3d(vbGrid, -size+i*dist, size, 0);
		vertex_normal(vbGrid, 0, 0, 0);
		vertex_texcoord(vbGrid, 0, 0);
		vertex_color(vbGrid, c_gray, alpha);
	}
	
	for (var i=0; i<ycount; i++) {
		if (i % 10 == 0) { alpha = .8; } else { alpha = .4; }
		
		// Vertical
		vertex_position_3d(vbGrid, -size, -size+i*dist, 0);
		vertex_normal(vbGrid, 0, 0, 0);
		vertex_texcoord(vbGrid, 0, 0);
		vertex_color(vbGrid, c_gray, alpha);
		
		vertex_position_3d(vbGrid, size, -size+i*dist, 0);
		vertex_normal(vbGrid, 0, 0, 0);
		vertex_texcoord(vbGrid, 0, 0);
		vertex_color(vbGrid, c_gray, alpha);
	}
	
	vertex_end(vbGrid);
	vertex_freeze(vbGrid);

	// Create the root center lines
	vbGridLines = vertex_create_buffer();
	vertex_begin(vbGridLines, global.ue_vertex_format);
	
	var offset = .05;

	// X Axis
	scrModelBuildRectPrism(-size, 0, 0, -offset, 0, 0, Colors3D.x, vbGridLines);
	scrModelBuildRectPrism(offset, 0, 0, size, 0, 0, Colors3D.x, vbGridLines);

	// Y Axis
	scrModelBuildRectPrism(0, -size, 0, 0, -offset, 0, Colors3D.y, vbGridLines);
	scrModelBuildRectPrism(0, offset, 0, 0, size, 0, Colors3D.y, vbGridLines);

	// Z Axis
	scrModelBuildRectPrism(0, 0, -size, 0, 0, -offset, Colors3D.z, vbGridLines);
	scrModelBuildRectPrism(0, 0, offset, 0, 0, size, Colors3D.z, vbGridLines);
	
	// Cube
	scrModelBuildCube(0, 0, 0, .15, c_white, vbGridLines);
	
	vertex_end(vbGridLines);
	vertex_freeze(vbGridLines);
}