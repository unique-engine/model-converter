draw_set_color(#060606);
draw_rectangle(0, 0, 300, winH, false);
draw_rectangle(winW-300, 0, winW, winH, false);
draw_rectangle(300, 0, winW-300, 50, false);

// Logo
draw_sprite(sprLogo, 0, winW - 15, 15);

// UI Drawing
//ui_draw();

// Model info
if (model) {
	var stats = getMeshStats(model);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom); 
	draw_set_color(c_white);
	var xx = winW - 15;
	var yy = winH - 10;
	scrDrawTextShadowed(xx, yy, $"Size X/Y/Z: {model.bbox_relative.x_size}/{model.bbox_relative.y_size}/{model.bbox_relative.z_size}");
	yy -= 20;
	scrDrawTextShadowed(xx, yy, "Animations: " + string(model.animations_num));
	yy -= 20;
	scrDrawTextShadowed(xx, yy, "Materials: " + string(model.materials_count));
	yy -= 20;
	scrDrawTextShadowed(xx, yy, "Vertices: " + scrGetPrettyNumber(stats.vertices_count));
	yy -= 20;
	scrDrawTextShadowed(xx, yy, "Faces: " + scrGetPrettyNumber(stats.faces_count));
	yy -= 20;
	scrDrawTextShadowed(xx, yy, "Meshes: " + string(stats.meshes_count));
	yy -= 20;
	scrDrawTextShadowed(xx, yy, "[ Model Info ]");
}

// Mouse cursor
if (cursorSprite) {
	draw_sprite(cursorSprite, 0, winMouseX, winMouseY);
}

/** Draw the controls and debug info **/
draw_set_halign(fa_right); draw_set_valign(fa_top);
var xx = winW - 10;
var yy = 80;

if (showControls) {
	draw_set_color(c_white);
	scrDrawTextShadowed(xx, yy, "[ Controls ]");
	yy += 20;	
	scrDrawTextShadowed(xx, yy, "Move the camera: WASD");
	yy += 20;
	scrDrawTextShadowed(xx, yy, "Zoom: Mouse wheel/Page Up/Down");
	yy += 20;
	scrDrawTextShadowed(xx, yy, "Elevation: Q/E/Ctrl/Space");
	yy += 20;
	scrDrawTextShadowed(xx, yy, "Camera pan: Middle mouse");
	yy += 20;
	scrDrawTextShadowed(xx, yy, "Rotate the camera: Right mouse");
	yy += 20;
	scrDrawTextShadowed(xx, yy, "Increase move speed: Hold shift");
	yy += 40;
} else {
	draw_set_color(c_white);
	scrDrawTextShadowed(xx, yy, "Show controls: F2");
	yy += 40;
}

if (debug) {
	scrDrawTextShadowed(xx, yy, "[ Camera Debug ]");
	yy += 20;
	draw_set_color(c_white);
	scrDrawTextShadowed(xx, yy, string("X/Y/Z: {0}/{1}/{2}", x, y, z));
	yy += 20;
	scrDrawTextShadowed(xx, yy, string("Direction: {0}", direction));
	yy += 20;
	scrDrawTextShadowed(xx, yy, string("ZDir: {0}", zdir));	
	yy += 20;
	scrDrawTextShadowed(xx, yy, $"Mouse X/Y: {winMouseX}/{winMouseY}");	
	yy += 20;
	scrDrawTextShadowed(xx, yy, $"Prev mouse X/Y:{winOldMouseX}/{winOldMouseY}");	
}