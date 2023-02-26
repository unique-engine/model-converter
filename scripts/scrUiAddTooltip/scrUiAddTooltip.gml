function scrUiAddTooltip(component, text) {
	var tooltip = new UiTooltip();
	
	with (tooltip.state) {
		linked_component = component;
	}
	
	tooltip.set_text(text);
	tooltip.focus();
	return tooltip;
}