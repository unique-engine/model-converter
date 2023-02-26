function scrDrawTextShadowed(xx, yy, text) {
	var col = draw_get_color();
	var alpha = draw_get_alpha();
	
	// Draw the shadow
	draw_set_alpha(.5);
	draw_set_color(c_black);
	draw_text(xx+1, yy+1, text);
	
	// Draw the actual text
	draw_set_alpha(alpha);
	draw_set_color(col);
	draw_text(xx, yy, text);
}