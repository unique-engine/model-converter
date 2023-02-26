enum ui_enum_checkbox_status {
	idle,
	hover,
	clicked,
}

/**
 * Get the logical UI component 
 *
 * @param {Real} _x Component X coordinate
 * @param {Real} _y Component Y coordinate
 * @param {Real} _width Component width
 * @param {Real} _height Component height
 * @param {Struct} [_parent] Parent component
 *
 * @return {Struct}
 */
function UiCheckboxStep(_x, _y, _width, _height, _parent = undefined) : UiBaseComponent(_x, _y, _width, _height, _parent) constructor {
	// Set the default checkbox status
	with (state) {
		status = ui_enum_checkbox_status.idle;
		type = ui_enum_variants.primary;
		checked = false;
		click_type = ui_enum_click_type.released;
		click_button = mb_left;
	}
		
	step = function() {
		var status = state.status;
		var click_type = state.click_type;
		var click_button = state.click_button;

		if (status != ui_enum_checkbox_status.idle && mouse_check_button_released(click_button)) {
			set({ status: ui_enum_checkbox_status.idle });
			
			if (click_type == ui_enum_click_type.released && is_hovered()) {
				set({ checked: !state.checked });
				click();
			}
		} else if (is_hovered()) {
			if (mouse_check_button_pressed(click_button)) {
				set({ status: ui_enum_checkbox_status.clicked });
				
				if (click_type == ui_enum_click_type.pressed) {
					click();	
				}
			} else if (status == ui_enum_checkbox_status.idle) {
				set({ status: ui_enum_checkbox_status.hover });
				
				if (window_get_cursor() == cr_default) {
					window_set_cursor(cr_handpoint);
				}
			}
		} else if (status == ui_enum_checkbox_status.hover) {
			set({ status: ui_enum_checkbox_status.idle });
			
			if (window_get_cursor() != cr_default && oCtrl.cursorSprite == undefined) {
				window_set_cursor(cr_default);
			}
		}
	};
}
