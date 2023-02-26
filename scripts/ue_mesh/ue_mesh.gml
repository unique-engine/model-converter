/**
 * UniqueMesh Class
 */
function UniqueMesh() constructor {
	gml_pragma("forceinline");
	
	vbuff = undefined;
	material = undefined;
	
	// Temporary build data
	vnum = 0; // Vertexes count
	inum = 0; // Indexes count
	indices = []; // Vertex face indexes
	positions = [];
	texcoord_channels = [];
	color_channels = [];
	
	/**
	 * Build the mesh based on the raw vertexes data
	 */
	build = function() {
		gml_pragma("forceinline");
		
		vbuff = vertex_create_buffer();
		vertex_begin(vbuff, global.ue_vertex_format);
		
		for (var i = 0; i < inum; i++) {
			var vindex = indices[i];
			
			// Position
			var vert_position = positions[vindex];
			vertex_position_3d(vbuff, vert_position[0], vert_position[1], vert_position[2]);
			
			// Normals
			var vert_normals = normals[vindex];
			vertex_normal(vbuff, vert_normals[0], vert_normals[1], vert_normals[2]);
			
			// TexCoords
			var vert_texcoords = undefined;
			
			if (array_length(texcoord_channels)) { 
				var texcoord_channel = texcoord_channels[0];
				
				if (array_length(texcoord_channel) > vindex) {
					var vert_texcoords = texcoord_channel[vindex];
				}
			}
			
			if (vert_texcoords == undefined) {
				vert_texcoords = array_create(4, 0);
			}
			
			vertex_texcoord(vbuff, vert_texcoords[0], vert_texcoords[1]);
			
			// Colors
			var col = undefined;
			if (array_length(color_channels)) { 
				var color_channel = color_channels[0];
			
				if (array_length(color_channel) > vindex) {
					col = color_channels[0][vindex];
				}
			}
			
			if (col == undefined) {
				col = array_create(3, 255);
			}
			
			vertex_color(vbuff, make_color_rgb(col[0], col[1], col[2]), 1);
		}
		
		vertex_end(vbuff);
	};
}