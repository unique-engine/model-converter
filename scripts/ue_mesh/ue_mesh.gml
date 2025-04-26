/**
 * UniqueMesh Class
 */
function UniqueMesh(_parent = undefined, create_vbuff = true, _vformat = global.ue_vertex_format) constructor {
	name = undefined;
	x = 0;
	y = 0;
	z = 0;
	xrot = 0;
	yrot = 0;
	zrot = 0;
	xscale = 1;
	yscale = 1;
	zscale = 1;
	material = new UniqueMaterial();
	primitive = pr_trianglelist;
	parent = _parent;
	children = [];
	children_length = 0;
	visible = true;
	
	// Vertex Format
	vformat = _vformat;
	var vformat_info = vertex_format_get_info(vformat);
    vformat_num_elements = vformat_info.num_elements;
    vformat_elements = vformat_info.elements;
	
	// Vertex buffer
	if (create_vbuff) {
		vbuff = vertex_create_buffer();
	    vertex_begin(vbuff, vformat);
	} else {
		vbuff = undefined;
	}
	
	/** Read only vars */
	matrix = undefined;
	matrix_relative = undefined;
	
	// Bounding Box
	bbox = { x1: 0, y1: 0, z1: 0, x2: 0, y2: 0, z2: 0, x_size: 0, y_size: 0, z_size: 0 };
	bbox_relative = { x1: 0, y1: 0, z1: 0, x2: 0, y2: 0, z2: 0, x_size: 0, y_size: 0, z_size: 0 };
	
	// Stats
	faces_count = 0;
	vertices_count = 0;
	
	/**
	 * Add a child mesh
	 */
	function add_child(_mesh) {
		array_push(children, _mesh);
		children_length++;
	}
	
	/**
	 * Remove a child mesh
	 */
	function remove_child(_index) {
		array_delete(children, _index, 1);
		children_length--;
	}	
	
	/**
	 * Build the transform matrix and cache it
	 */
	function transform() {
		matrix = matrix_build(x, y, z, xrot, yrot, zrot, xscale, yscale, zscale);
		matrix_relative = parent != undefined ? matrix_multiply(parent.matrix, matrix) : matrix;
		
		var child;
		for (var i=0; i<children_length; i++) {
			child = children[i];
			child.transform();
		}
	};
	
	/**
	 * Freeze all the meshes vbuffers
	 */
	function freeze() {
		if (vbuff) {
			vertex_freeze(vbuff);
		}
		
		for (var i=0; i<children_length; i++) {
			children[i].freeze();
		}
	}
	
	/**
	 * Draw the model
	 */
	function draw() {
		if (vbuff && visible) {
			matrix_set(matrix_world, matrix_relative);
			var diffuseTexture = material.textures[$ "diffuse"] ?? -1;
			vertex_submit(vbuff, primitive, diffuseTexture);
			
			// Draw the wireframe
			//var shader = shader_current();
			//shader_reset();
			//vertex_submit(vbuff, pr_linelist, -1);
			//shader_set(shader);
		}
		
		for (var i=0; i<children_length; i++) {
			children[i].draw();
		}
	};
	
	/**
	 * Free the model and its children from the memory
	 */
	function destroy() {
		if (vbuff) {
			vertex_delete_buffer(vbuff);
		}
		
		for (var i=0; i<children_length; i++) {
			children[i].destroy();
		}
	};
	
	/** 
	 * Calculate and store the bounding box considering this mesh and its the children
	 */
	function calculate_relative_bbox() {
		var child, x1, y1, z1, x2, y2, z2;
		for (var i=0; i<children_length; i++) {
			child = children[i];
			child.calculate_relative_bbox();
			
			var child_bbox = child.bbox_relative;
			bbox_relative.x1 = min(bbox_relative.x1, child_bbox.x1); 
			bbox_relative.y1 = min(bbox_relative.y1, child_bbox.y1); 
			bbox_relative.z1 = min(bbox_relative.z1, child_bbox.z1); 
			bbox_relative.x2 = max(bbox_relative.x2, child_bbox.x2); 
			bbox_relative.y2 = max(bbox_relative.y2, child_bbox.y2); 
			bbox_relative.z2 = max(bbox_relative.z2, child_bbox.z2); 
		} 
		
		bbox_relative.x_size = bbox_relative.x2 - bbox_relative.x1;
		bbox_relative.y_size = bbox_relative.y2 - bbox_relative.y1;
		bbox_relative.z_size = bbox_relative.z2 - bbox_relative.z1;
	}
	
	/**
	 * Returns a cloned mesh, including its children.
	 * Note: the mesh must not be frozen
	 */
	//clone = function() {
	//	var buff = buffer_create_from_vertex_buffer(vbuff, buffer_vbuffer, 1);
	//	var dst_mesh = new UniqueMesh();
	//	dst_mesh.vbuff = vertex_create_buffer_from_buffer(buff, vformat);
	//	buffer_delete(buff);
	//	dst_mesh.material = material;
		
	//	var dst_meshes_map = {};
		
	//	for (var m=0; m<meshes_count; m++) {
	//		var src_mesh = meshes[m];
	//		var dst_mesh = new UniqueMesh();
	//		var buff = buffer_create_from_vertex_buffer(src_mesh.vbuff, buffer_vbuffer, 1);
	//		dst_mesh.vbuff = vertex_create_buffer_from_buffer(buff, global.ue_vertex_format);
	//		buffer_delete(buff);
	//		dst_mesh.material = src_mesh.material;
	//		//array_push(dst_meshes, dst_mesh);
	//		dst_meshes_map[$ $"mesh{m}"] = dst_mesh;
	//	}
		
	//	return new UniqueModel(dst_meshes_map);
	//};
	
	/** 
	 * Compile the model to a Unique buffer file
	 */
	//save = function(path) {
	//	var buffer = buffer_create(1024*100, buffer_grow, 1);
	//	var path_relative = filename_path(path);
	//	var materials_store = {};
	
	//	buffer_write(buffer, buffer_string, model_version);
	//	buffer_write(buffer, buffer_u16, meshes_count);
	
	//	for (var a=0; a<meshes_count; a++) {
	//		var mesh = meshes[a];
	//		var vbuff = mesh.vbuff;
		
	//		// Write the vbuff bytes size
	//		var vbuff_buffer = buffer_create_from_vertex_buffer(vbuff, buffer_vbuffer, 1);
	//		var vbuff_buffer_size = buffer_get_size(vbuff_buffer);
	//		buffer_write(buffer, buffer_u32, vbuff_buffer_size);
		
	//		// Write the vbuff
	//		buffer_copy(vbuff_buffer, 0, vbuff_buffer_size, buffer, buffer_tell(buffer));
	//		buffer_delete(vbuff_buffer);
	//		buffer_seek(buffer, buffer_seek_relative, vbuff_buffer_size);
		
	//		// Write the material textures
	//		var textures = mesh.material.textures;
	//		var textures_names = variable_struct_get_names(textures);
	//		var textures_count = array_length(textures_names);
			
	//		buffer_write(buffer, buffer_u8, textures_count);
	//		for (var t=0; t<textures_count; t++) {
	//			var texture = textures[$ textures_names[t]];
		
	//			// Write the texture type and id
	//			buffer_write(buffer, buffer_string, texture.type);
	//			buffer_write(buffer, buffer_string, texture_id);
	//		}
	//	}
	
	//	var buffer_compressed = buffer_compress(buffer, 0, buffer_get_size(buffer));
	//	buffer_delete(buffer);
	//	buffer_save(buffer_compressed, path);
	//	buffer_delete(buffer_compressed);
	//};
	
	/**
	 * Load a Model directly from a Unique buffer file
	 *
	 * @param {String} path
	 * @param {Bool} load_textures
	 */
	//load = function(path, load_textures = true) {
	//	var path_relative = filename_path(path);
	//	var raw_buffer = buffer_load(path);
	//	var buffer = buffer_decompress(raw_buffer);
	//	buffer_delete(raw_buffer);
		
	//	// Check the model version
	//	var model_version = buffer_read(buffer, buffer_string);
	//	if (model_version != global.ue_model_version) {
	//		throw "ue_error_model_version_mismatch";
	//	}
		
	//	// Get the meshes count
	//	meshes_count = buffer_read(buffer, buffer_u16);
		
	//	for (var a=0; a<meshes_count; a++) {
	//		// Get the vbuff bytes size
	//		var vbuff_buffer_size = buffer_read(buffer, buffer_u32);
		
	//		// Read the vbuff
	//		var vbuff_buffer = buffer_create(vbuff_buffer_size, buffer_vbuffer, 1);
	//		buffer_copy(buffer, buffer_tell(buffer), vbuff_buffer_size, vbuff_buffer, 0);
	//		var vbuff = vertex_create_buffer_from_buffer(vbuff_buffer, global.ue_vertex_format);
	//		buffer_delete(vbuff_buffer);
	//		buffer_seek(buffer, buffer_seek_relative, vbuff_buffer_size);
			
	//		// Create the material and load the textures
	//		var material = new UniqueMaterial();
			
	//		if (load_textures) {
	//			var textures = material.textures;
	//			var textures_count = buffer_read(buffer, buffer_u8);
			
	//			for (var t=0; t<textures_count; t++) {
	//				//Get the texture type and id
	//				var texture_type = buffer_read(buffer, buffer_string);
	//				var texture_id = buffer_read(buffer, buffer_string);
				
	//				// Get the texture from the cache if already loaded
	//				if (global.ue_textures[$ texture_id]) {
	//					textures[$ texture_type] = global.ue_textures[$ texture_id];
	//				}	
	//			}
	//		}
			
	//		var mesh = new UniqueMesh();
	//		mesh.vbuff = vbuff;
	//		array_push(meshes, mesh);
	//	}
		
	//	buffer_delete(buffer);
	//};
	
	transform();
}