/**
 * Get the render UI component 
 *
 * @param {Real} _x Component X coordinate
 * @param {Real} _y Component Y coordinate
 * @param {Real} _width Component width
 * @param {Real} _height Component height
 * @param {Struct} [_parent] Parent component
 *
 * @return {Struct}
 */
function UiCheckbox(_x, _y, _width, _height, _parent = undefined) : UiCheckboxStep(_x, _y, _width, _height, _parent) constructor {	
	draw = function() {
		var type = state[$ "type"] ?? ui_enum_variants.primary;
		
		// Draw the background
		var bgcolor;
		switch (state.status) {
			case ui_enum_checkbox_status.clicked:
				bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary_dark : ui_variable_col_secondary_dark;
				break;
			case ui_enum_checkbox_status.hover:
				bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary_light : ui_variable_col_secondary_light;
				break;
			default: 
				bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary : ui_variable_col_secondary;
		}
		
		var checkboxWidth = state.height;
		draw_set_color(bgcolor);
		draw_rectangle(0, 0, checkboxWidth, state.height, false);
		
		// If checked, draw the sprite
		if (state.checked) {
			var center = checkboxWidth/2;
			draw_sprite(sprCheck, 0, center, center);
		}
		
		// Draw the text
		draw_set_color(ui_variable_col_on_bg); 
		draw_set_halign(fa_left); 
		draw_set_valign(fa_middle); 
		draw_set_font(ui_variable_font);
		scrDrawTextShadowed(round(checkboxWidth + 10), round(state.height/2), state.text);
	};
}
