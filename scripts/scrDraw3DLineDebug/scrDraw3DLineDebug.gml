function scrDraw3DLineDebug(x1, y1, z1, x2, y2, z2) {
	var col = draw_get_color();
	var alpha = draw_get_alpha();
	
	var vbuff = vertex_create_buffer();
	vertex_begin(vbuff, vforPosCol);
	vertex_position_3d(vbuff, x1, y1, z1)
	vertex_color(vbuff, col, alpha);
	
	vertex_position_3d(vbuff, x2, y2, z2);
	vertex_color(vbuff, col, alpha);
	
	vertex_end(vbuff);
	vertex_freeze(vbuff);
	vertex_submit(vbuff, pr_linelist, -1);
}