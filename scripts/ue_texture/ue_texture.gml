function UniqueTexture(texture_path, texture_type, sprite) constructor {
	gml_pragma("forceinline");
	
	id = texture_path;
	type = texture_type;
	self.sprite = sprite;
	texture = sprite_get_texture(sprite, 0);
}