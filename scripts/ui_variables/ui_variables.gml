// UI enums
enum ui_enum_variants {
	primary,
	secondary
}

enum ui_enum_click_type {
	released,
	pressed
}

// Primary - used to represent primary interface elements for a player.
// It's the color displayed most frequently across your game's screens and components.
#macro ui_variable_col_primary #0066ff
#macro ui_variable_col_primary_light #008ae6
#macro ui_variable_col_primary_dark #0066ff
#macro ui_variable_col_on_primary #FFFFFF

// Secondary - used to represent secondary interface elements for a user.
// It provides more ways to accent and distinguish your game. Having it is optional.
#macro ui_variable_col_secondary #ffc107
#macro ui_variable_col_secondary_light #fff350
#macro ui_variable_col_secondary_dark #c79100
#macro ui_variable_col_on_secondary #000000

// Background color
#macro ui_variable_col_bg #000000
#macro ui_variable_col_on_bg #FFFFFF

#macro ui_variable_font ui_font