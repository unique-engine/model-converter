function AssimpImporter() constructor // Feather disable GM2023
{
	// Store a texture inside the shared store
	/// @ignore
	store_material_texture = function(model_path, material_type, texture_path) {
		var texture = global.ue_textures[$ texture_path];
		if (global.ue_textures[$ texture_path] == undefined) {
			var fullPath = model_path + "/" + texture_path;
			
			if (!file_exists(fullPath)) {
				fullPath = model_path + "/" + filename_change_ext(texture_path, ".jpg");
				
				if (!file_exists(fullPath)) {
					fullPath = model_path + "/" + filename_change_ext(texture_path, ".png");
				}
			}
			
			var sprite = sprite_add(fullPath, 1, false, false, 0, 0);
			if (sprite != -1) texture = ue_load_texture(sprite, 0, texture_path);
		}
		return texture;
	}

	/// @ignore
	static read_binded_material = function(material, model_path) {
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
			[ "displacement", GMA_TEXTURE_TYPE_DISPLACEMENT ],
			[ "emissive", GMA_TEXTURE_TYPE_EMISSIVE ],
			[ "lightmap", GMA_TEXTURE_TYPE_LIGHTMAP ],
			[ "height", GMA_TEXTURE_TYPE_HEIGHT ],
			[ "opacity", GMA_TEXTURE_TYPE_OPACITY ],
			[ "specular", GMA_TEXTURE_TYPE_SPECULAR ],
			[ "unknown", GMA_TEXTURE_TYPE_UNKNOWN ],
		];
		
		for (var i=0; i<array_length(material_types); i++) {
			var material_type = material_types[i];
			var material_type_str = material_type[0];
			var fname = filename_name(GMA_GetMaterialTextureName(material_type[1], 0));
			
			if (fname != "") {
				textures[$ material_type_str] = store_material_texture(model_path, material_type_str, fname);
			}
		}
	}
	
	/// @ignore
	static read_binded_mesh = function(mesh) {
		var vbuff = mesh.vbuff;
		var vformat_num_elements = mesh.vformat_num_elements;
		var vformat_elements = mesh.vformat_elements;
		
		var mesh_facenum = GMA_GetMeshFacesNum();
		var mesh_vnum = GMA_GetMeshVerticesNum();
		var mesh_channel_num_color = GMA_GetMeshColorChannelsNum();
		var mesh_channel_num_texcoord = GMA_GetMeshUVChannelsNum();		
		var face_vindex;

		// Loop over the faces
		for (var f=0; f<mesh_facenum; f++) {
			// Loop over the vertex indexes of this face
			for (var fi=0, fn=GMA_GetMeshFaceVerticesNum(f); fi<fn; fi++) {
				var v = GMA_GetMeshFaceVertexIndex(f, fi);
				
				// Per each vertex index, add the relative vertex data
				for (var e=0; e<vformat_num_elements; e++) {
					var vformat_element = vformat_elements[e];
			
					switch (vformat_element.usage) {
						case vertex_usage_position:
							var xx = GMA_GetMeshVertexX(v);
							var yy = GMA_GetMeshVertexY(v);
							var zz = GMA_GetMeshVertexZ(v);
							vertex_position_3d(vbuff, xx, yy, zz);
						break;
						
						case vertex_usage_normal:
							vertex_normal(vbuff, GMA_GetMeshNormalX(v), GMA_GetMeshNormalY(v), GMA_GetMeshNormalZ(v));
						break;
						
						case vertex_usage_texcoord:
							if (GMA_GetMeshUVChannelsNum()) {
								vertex_texcoord(vbuff, GMA_GetMeshTexCoordU(v, 0), GMA_GetMeshTexCoordV(v, 0));
							} else {
								vertex_texcoord(vbuff, 0, 0);
							}
						break;
					
						case vertex_usage_color:
							if (GMA_GetMeshColorChannelsNum()) {
								vertex_color(vbuff, make_color_rgb(GMA_GetMeshVertexColorGM(v, 0), GMA_GetMeshVertexColorGM(v, 0), GMA_GetMeshVertexColorGM(v, 0)), GMA_GetMeshVertexAlpha(v, 0));
							} else {
								vertex_color(vbuff, make_color_rgb(255, 255, 255), 1);
							}
						break;
					}
				}
			}
		}
		
		vertex_end(vbuff);
		
		// Store the bounding box
		var x1 = GMA_GetMeshAABBMinX();
		var y1 = GMA_GetMeshAABBMinY();
		var z1 = GMA_GetMeshAABBMinZ();
		var x2 = GMA_GetMeshAABBMaxX();
		var y2 = GMA_GetMeshAABBMaxY();
		var z2 = GMA_GetMeshAABBMaxZ();
		mesh.bbox = { x1, y1, z1, x2, y2, z2, x_size: x2 - x1, y_size: y2 - y1, z_size: z2 - z1 };
		mesh.bbox_relative = { x1, y1, z1, x2, y2, z2, x_size: x2 - x1, y_size: y2 - y1, z_size: z2 - z1 };
		
		// Update the mesh stats
		mesh.faces_count = mesh_facenum;
		mesh.vertices_count = mesh_vnum;
	}
	
	/**
	 * Import a model and extract its material and meshes
	 */
	static import = function(filename, vformat = global.ue_vertex_format) {
		if (!GMA_IsWorking()) {
			return show_error("Assimp extension is not working", true);
		}
		
		var assimp_importer = GMA_CreateImporter();
		GMA_BindImporter(assimp_importer);
		
		var check = GMA_ReadFile(filename,
			GMA_PP.GEN_BOUNDING_BOXES |
			
			GMA_PP.MAKE_LEFT_HANDED |
			GMA_PP.FLIP_UVS |
			GMA_PP.FLIP_WINDING_ORDER |
			
			// Fast
			GMA_PP.CALC_TANGENT_SPACE |
			GMA_PP.GEN_NORMALS |
			GMA_PP.JOIN_IDENTICAL_VERTICES |
			GMA_PP.GEN_UV_COORDS |
			GMA_PP.SORT_BY_PTYPE |
			
			// Quality
			GMA_PP.CALC_TANGENT_SPACE |
			//GMA_PP.GEN_SMOOTH_NORMALS | // Not needed
			GMA_PP.JOIN_IDENTICAL_VERTICES |
			GMA_PP.IMPROVE_CACHE_LOCALITY | 
			//GMA_PP.LIMIT_BONE_WEIGHTS | // @todo: test
			//GMA_PP.REMOVE_REDUNDANT_MATERIALS | // Let the user handle all materials
			//GMA_PP.SPLIT_LARGE_MESHES | // @todo: test, is it needed?
			GMA_PP.TRIANGULATE |
			GMA_PP.GEN_UV_COORDS |
			GMA_PP.SORT_BY_PTYPE |
			GMA_PP.FIND_DEGENERATES |
			GMA_PP.FIND_INVALID_DATA
			
			// Max quality
			//GMA_PP.FIND_INSTANCES | // random vertices count??
			//GMA_PP.VALIDATE_DATA_STRUCTURE |
			//GMA_PP.OPTIMIZE_GRAPH | 
			//GMA_PP.OPTIMIZE_MESHES 
		);

		// Check if the file is correctly loaded
		if (!check) {	
			show_message_async("[Assimp Importer] Error: " + GMA_GetImporterErrorString());
			return;
		}

		GMA_BindScene();
		var model_path = filename_path(filename);
		var model = new UniqueMesh(undefined, false);
		
		// Get the materials
		var materials = [];		
		var materials_count = GMA_GetMaterialNum();
		for (var i=0; i<materials_count; i++)	{
		    GMA_BindMaterial(i);
			var material = new UniqueMaterial();
			read_binded_material(material, model_path);
			materials[i] = material;
		}
				
		// Add the meshes data
		for (var i = 0; i < GMA_GetMeshNum(); i++)	{
		    GMA_BindMesh(i);
			var mesh = new UniqueMesh(model, true, vformat);
			mesh.name = GMA_GetMeshName();
			read_binded_mesh(mesh);
			mesh.material = materials[GMA_GetMeshMaterialIndex()].clone();
			model.add_child(mesh);
		}
		
		var animations_count = GMA_GetAnimationNum();
		//for (var i = 0; i < animations_count; i++) {
		//	GMA_BindAnimation(i);
			
		//	GMA_GetAnimationMeshChannelsNum()
		//	GMA_GetAnimationTicksPerSecond()
		//	//GMA_GetMeshAnimKeyTime()
		//	//GMA_GetMeshAnimKeyValue()
		//	//GMA_GetMeshAnimKeysNum()
		//	//GMA_GetMeshAnimNodeName()
		//	//GMA_GetAnimationName()
		//	//GMA_BindMeshAnimation()
		//	//GMA_BindNodeAnimation()
		//	//GMA_BindNodeChild()
		//	//GMA_BindNodeChildFromName()
		//	//GMA_BindNodeMatrix()
		//	//GMA_BindNodeParent()
		//	//GMA_BindBoneOffsetMatrix()
		//	//GMA_GetBoneName()
		//	//GMA_GetBoneNumWeights()
		//	//GMA_GetBoneVertexIndex()
		//	//GMA_GetBoneVertexWeight()			
		//	//GMA_BindSceneNode()
		//	//GMA_GetNodeName()
		//	//etc.
		//}
			
		GMA_DeleteImporter(assimp_importer);
		
		// Start with a default Y/Z rotation of the model
		model.yrot = 180;
		model.zrot = 180;
		model.transform();
		
		model.materials_count = materials_count;
		model.animations_num = animations_count;
		model.calculate_relative_bbox();
		return model;
	}
}
