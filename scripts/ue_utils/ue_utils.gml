ue_vertex_format = ue_create_vformat([ 
	vertex_usage_position, 
	vertex_usage_normal, 
	vertex_usage_texcoord, 
	vertex_usage_color
]);
ue_matrix_identity = matrix_build_identity();
ue_textures = {};

/** 
 * Get an array of values of a struct
 */
//function ue_struct_values(struct) {
//    var values = [];
//    var keys = variable_struct_get_names(struct);
//    for (var i=0; i<array_length(keys); i++) {
//        array_push(values, struct[$ keys[i]]);
//    }
//    return values;
//}

/**
 * Holds a struct of items. Items can be also accessed through an array, when needed for performance reasons.
 * The array is synchronized with the struct, when adding/removing items.
 */
//function PackedList() constructor {
//	/** Read only vars */
//	map = {};
//	list = [];
//	length = 0;
	
//	/** 
//	 * Add a new item with a specific name
//	 */
//	function add(_name, _item) {
//		array_push(list, { value: _item, name: _name });
//		map[$ _name] = { value: _item, index: length++ };
//	}
	
//	/**
//	 * Remove an item
//	 */
//	function unset(_name) {
//        var entry = map[$ _name];
//        var index = entry.index;

//        array_delete(list, index, 1);
//        delete map[$ _name];

//		var list_item;
//        for (var i = index, len = length - 1; i < len; i++) {
//			list_item = list[i];
//            list_item.index = i;
//            map[$ list_item.name].index = i;
//        }

//        length--;	
//	}
	
//	/**
//	 * Unset an item by using its index
//	 */
//	function unset_by_index(_index) {
//		var item = list[_index];
//        var _name = item.name;

//        array_delete(list, _index, 1);
//        delete map[$ _name];

//        var list_item;
//        for (var i = index, len = length - 1; i < len; i++) {
//			list_item = list[i];
//            list_item.index = i;
//            map[$ list_item.name].index = i;
//        }

//        length--;
//	}
	
//	/**
//	 * Retrieve the item value
//	 */
//	function get(_name) {
//		return map[$ _name].value;
//	}
	
//	/**
//	 * Get an item value by its index
//	 */
//	function get_by_index(_index) {
//		return list[_index].value;
//	}
	
//	/**
//	 * Retrieve the item index
//	 */
//	function get_index(_name) {
//		return map[$ _name].index;
//	}
	
//	/**
//	 * Retrieve the item name by its index
//	 */
//	function get_name_by_index(_index) {
//		return list[_index].name;
//	}
	
//	/**
//	 * Check if the item with this name exists
//	 */
//	function has(_name) {
//		return variable_struct_exists(map, _name);
//	}
	
//	/**
//	 * Check if the item with this index exists
//	 */
//	function has_by_index(_index) {
//		return _index < length;
//	}
	
//	/**
//	 * Loop over the items and calls the callback on each one
//	 */
//	function each(callback) {
//		for (var i = 0; i < length; i++) {
//			callback(list[i].value, i);
//		}
//	}
	
//	/**
//	 * Loop over the items and calls the callback on each one. 
//	 * Returns a new array with the values returned from all callbacks
//	 */
//	function each_map(callback) {
//		var array = [];
//		for (var i = 0; i < length; i++) {
//			array_push(array, callback(list[i].value, i));
//		}
//		return array;
//	}
	
//	/**
//	 * Loop over the items, calling the callback on each one. 
//	 * Accumulates a result and returns it.
//	 */
//	function each_reduce(callback, initial_value) {
//	    var accumulator = initial_value;
//	    for (var i = 0; i < length; i++) {
//	        accumulator = callback(accumulator, list[i].value, i);
//	    }
//	    return accumulator;
//	}
//}

/**
* Create a vformat with a custom order and configuration
*/
function ue_create_vformat(
	vformat_order = [vertex_usage_position, vertex_usage_normal, vertex_usage_texcoord, vertex_usage_color]
) {
	vertex_format_begin();
		
	for (var i=0, len=array_length(vformat_order); i<len; i++) {
		var vformat_key = vformat_order[i];
			
		switch (vformat_key) {
			case vertex_usage_position: vertex_format_add_position_3d(); break;
			case vertex_usage_normal: vertex_format_add_normal(); break;
			case vertex_usage_texcoord: vertex_format_add_texcoord(); break;
			case vertex_usage_color: vertex_format_add_color(); break;
		}
	}
		
	return vertex_format_end();
}

/**
 * Get a texture from a sprite. It stores the texture into a global map to quickly reuse it
 */
function ue_load_texture(sprite_index, image_index = 0, texture_id = undefined) {
	if (texture_id != undefined) {
		texture_id = $"{sprite_get_name(sprite_index)}_{image_index}";
	}
	
	if (global.ue_textures[$ texture_id] == undefined) {
		global.ue_textures[$ texture_id] = sprite_get_texture(sprite_index, image_index);
	}
	
	return global.ue_textures[$ texture_id];
}