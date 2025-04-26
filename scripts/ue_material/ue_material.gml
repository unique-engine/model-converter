function UniqueMaterial() constructor {
	textures = {};
	color_diffuse = [];
	color_ambient = [];
	color_specular = [];
	color_emissive = [];
	
	function set_texture(type, texture_id) {
		textures[$ type] = global.ue_textures[$ texture_id];
	}
	
	function unset_texture(type) {
		delete textures[$ type];
	}
	
	/**
	 * Clone the material by creating a new one with the same props.
	 * The textures will still reference the original ones because they are defined globally
	 */
	function clone() {
		var material = new UniqueMaterial();
		
		var _textures = {};
		var types = variable_struct_get_names(textures);
		for (var i=0, len=array_length(types); i<len; i++) {
			var type = types[i];
			_textures[$ type] = textures[$ type];
		}
		
		material.textures = _textures;
		material.color_diffuse = color_diffuse;
		material.color_ambient = color_ambient;
		material.color_specular = color_specular;
		material.color_emissive = color_emissive;
		return material;
	}
}