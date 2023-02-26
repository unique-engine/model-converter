// @author		Giacomo Marton
// @version		1.0.0

function AssimpImporter() constructor {
	gml_pragma("forceinline");

	// Store a texture inside the shared materials store
	/// @ignore
	store_material_texture = function(materials_store, model_path, material_type, texture_path) {
		gml_pragma("forceinline");
	
		if (!variable_struct_exists(materials_store, texture_path)) {
			var sprite = sprite_add(model_path + "/" + texture_path, 1, false, false, 0, 0);
			if (sprite == -1) return;
			materials_store[$ texture_path] = new UniqueTexture(texture_path, material_type, sprite);
		}
				
		return materials_store[$ texture_path];
	}

	/// @ignore
	static read_binded_material = function(material, materials_store, model_path) {
		gml_pragma("forceinline");
		
		material.color_diffuse = [GMA_GetMaterialDiffuseColorR(),
													GMA_GetMaterialDiffuseColorG(),
													GMA_GetMaterialDiffuseColorB(),
													GMA_GetMaterialOpacity()];
			
		material.color_ambient = [GMA_GetMaterialAmbientColorR(),
													GMA_GetMaterialAmbientColorG(),
													GMA_GetMaterialAmbientColorB(),
													1.0];
			
		material.color_specular = [GMA_GetMaterialSpecularColorR(),
													GMA_GetMaterialSpecularColorG(),
													GMA_GetMaterialSpecularColorB(),
													1.0];
			
		material.color_emissive = [GMA_GetMaterialEmissiveColorR(),
													GMA_GetMaterialEmissiveColorG(),
													GMA_GetMaterialEmissiveColorB(),
													1.0];
		
		var textures = material.textures;
		var material_types = [
			[ "diffuse", GMA_TEXTURE_TYPE_DIFFUSE ],
			[ "normals", GMA_TEXTURE_TYPE_NORMALS ],
			[ "reflection", GMA_TEXTURE_TYPE_REFLECTION ],
			[ "shininess", GMA_TEXTURE_TYPE_SHININESS ],
			[ "ambient", GMA_TEXTURE_TYPE_AMBIENT ],
		];
		
		for (var i=0; i<array_length(material_types); i++) {
			var material_type = material_types[i];
			var material_type_str = material_type[0];
			var fname = filename_name(GMA_GetMaterialTextureName(material_type[1], 0));
			
			if (fname != "") {
				textures[$ material_type_str] = store_material_texture(materials_store, model_path, material_type_str, fname);
			}
		}
	}
	
	/// @ignore
	static read_binded_mesh = function(mesh, model_stats) {
		gml_pragma("forceinline");
		
		var mesh_indices;
		var mesh_positions;
		var mesh_color_channels = [];
		var mesh_texcoord_channels = [];
		var mesh_normals;
		var mesh_tangents;
		var mesh_bitangents;

		var mesh_facenum = GMA_GetMeshFacesNum();
		var mesh_vnum = GMA_GetMeshVerticesNum();
		var mesh_inum = mesh_facenum * 3;
		var mesh_channel_num_color = GMA_GetMeshColorChannelsNum();
		var mesh_channel_num_texcoord = GMA_GetMeshUVChannelsNum();
		
		// Creates the arrays for performance on creation
		for (var i = 0; i < mesh_channel_num_color; i++) {
			mesh_color_channels[i][mesh_vnum - 1] = 0;
		}
	
		for (var i = 0; i < mesh_channel_num_texcoord; i++) {
			mesh_texcoord_channels[i][mesh_vnum - 1] = 0;
		}
	
		mesh_indices[mesh_inum - 1] = 0;
		mesh_positions[mesh_vnum - 1] = 0;
		if (GMA_MeshHasNormals())	{
			mesh_normals[mesh_vnum - 1] = 0;
		} else {
			mesh_normals = undefined;
		}
		
		if (GMA_MeshHasTangents()) {
			mesh_tangents[mesh_vnum - 1] = 0;
			mesh_bitangents[mesh_vnum - 1] = 0;
		} else {
			mesh_tangents = undefined;
			mesh_bitangents = undefined;
		}

		for (var i = 0; i < mesh_facenum; i++) {
			mesh_indices[i*3 + 0] = GMA_GetMeshFaceVertexIndex(i, 0);
			mesh_indices[i*3 + 1] = GMA_GetMeshFaceVertexIndex(i, 1);
			mesh_indices[i*3 + 2] = GMA_GetMeshFaceVertexIndex(i, 2);
		}
	
		for (var v = 0; v < mesh_vnum; v++) {
			mesh_positions[v] =
				[GMA_GetMeshVertexX(v) ,
				 GMA_GetMeshVertexY(v) ,
				 GMA_GetMeshVertexZ(v)];
	
			for (var c = 0; c < mesh_channel_num_color; c++) {
				mesh_color_channels[c] [v] = GMA_GetMeshVertexColorGM(v, c);
			}
	
			if (GMA_MeshHasNormals()) {
				mesh_normals[v] =
					[GMA_GetMeshNormalX(v),
					 GMA_GetMeshNormalY(v),
					 GMA_GetMeshNormalZ(v)];
			}
	
			if (GMA_MeshHasTangents()) {
				mesh_tangents[v] =
					[GMA_GetMeshTangentX(v),
					 GMA_GetMeshTangentY(v),
					GMA_GetMeshTangentZ(v)];
					
				mesh_bitangents[v] =
					[GMA_GetMeshBitangentX(v) ,
					 GMA_GetMeshBitangentY(v) ,
					 GMA_GetMeshBitangentZ(v)];
			}
		
			for (var c = 0; c < mesh_channel_num_texcoord; c++) {
				mesh_texcoord_channels[c][v] = [GMA_GetMeshTexCoordU(v, c),
																		GMA_GetMeshTexCoordV(v, c)];
			}
		}

		mesh.vnum = mesh_vnum;
		mesh.inum = mesh_inum;
		mesh.indices = mesh_indices;
		mesh.positions = mesh_positions;
		mesh.color_channels = mesh_color_channels;
		mesh.texcoord_channels = mesh_texcoord_channels;
		mesh.normals = mesh_normals;
		mesh.tangents = mesh_tangents; // @todo: not used yet
		mesh.bitangents = mesh_bitangents; // @todo: not used yet
		//mesh.custom_channels = []; // @todo: not used yet
		
		// Update the model stats
		model_stats.faces_count += mesh_facenum;
		model_stats.triangles_count += mesh_inum;
		model_stats.vertices_count += mesh_vnum;
	}
	
	/**
	 * Import a model and extract its material and meshes
	 */
	static import = function(filename) {
		gml_pragma("forceinline");
		
		if (!GMA_IsWorking()) {
			return show_error("Assimp extension is not working", true);
		}
		
		var assimp_importer = GMA_CreateImporter();
		GMA_BindImporter(assimp_importer);
		
		var check = GMA_ReadFile(filename,
			GMA_PP.CONVERT_TO_LEFT_HANDED |
			GMA_PP.FIND_DEGENERATES |
			GMA_PP.TARGET_REALTIME_MAX_QUALITY |
			GMA_PP.OPTIMIZE_GRAPH |
			GMA_PP.OPTIMIZE_MESHES |
			GMA_PP.VALIDATE_DATA_STRUCTURE
		);

		//Check if the file is correctly loaded
		if (!check) {	
			show_debug_message("[Assimp Importer] Error: " + GMA_GetImporterErrorString());
			return uiNotificationElem.add_item("Error: " + GMA_GetImporterErrorString());
		}
		
		GMA_BindScene();
		var model_path = filename_path(filename);
		var model_stats =  {
			faces_count: 0,
			triangles_count: 0,
			vertices_count: 0			
		};
		var materials_count = GMA_GetMaterialNum();
		
		// Get the materials
		var materials = [];
		var materials_store = {};
		
		for (var i = 0; i < materials_count; i++)	{
		    GMA_BindMaterial(i);
			var material = new UniqueMaterial();
			read_binded_material(material, materials_store, model_path);
			materials[i] = material;
		}
				
		// Get the meshes
		var meshes = [];
		
		for (var i = 0; i < GMA_GetMeshNum(); i++)	{
		    GMA_BindMesh(i);			
			var mesh = new UniqueMesh();
			read_binded_mesh(mesh, model_stats);
			mesh.build();
			mesh.material = materials[GMA_GetMeshMaterialIndex()];			
			array_push(meshes, mesh);
		}
			
		GMA_DeleteImporter(assimp_importer);
		var model = new UniqueModel(meshes);
		
		model.faces_count = model_stats.faces_count;
		model.triangles_count = model_stats.triangles_count;
		model.vertices_count = model_stats.vertices_count;
		model.materials_count = materials_count;
		
		return model;
	}
}
