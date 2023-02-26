gpu_set_cullmode(cull_noculling);

// UI Backgrounds
draw_set_alpha(.9);
draw_rectangle_color(0, 0, winW, guiTopHeight, #0857B7, #6F08B7, #6F08B7, #0857B7, false);

draw_set_alpha(.2);
draw_set_color(#111111);
draw_rectangle(guiLeftWidth+1, guiLeftY, guiLeftWidth+3, winH, false);
draw_set_alpha(.9);
draw_set_color(#1B1F23);
draw_rectangle(0, guiLeftY, guiLeftWidth, winH, false);


// Logo
draw_set_alpha(1);
draw_sprite(sprLogo, 0, winW - 15, 25);

// UI Drawing
ui_draw();

// Model info
if (model) {
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom); 
	draw_set_color(c_white);
	var xx = winW - 15;
	var yy = winH - 10;
	scrDrawTextShadowed(xx, yy, "Materials: " + string(model.materials_count));
	yy -= 20;
	scrDrawTextShadowed(xx, yy, "Vertices: " + scrGetPrettyNumber(model.vertices_count));
	yy -= 20;
	scrDrawTextShadowed(xx, yy, "Triangles: " + scrGetPrettyNumber(model.triangles_count));
	yy -= 20;
	scrDrawTextShadowed(xx, yy, "Faces: " + scrGetPrettyNumber(model.faces_count));
	yy -= 20;
	scrDrawTextShadowed(xx, yy, "Meshes: " + string(model.meshes_count));
	yy -= 20;
	draw_set_color(ui_variable_col_primary_light);
	scrDrawTextShadowed(xx, yy, "[ Model Info ]");
}

// Mouse cursor
if (cursorSprite) {
	draw_sprite(cursorSprite, 0, winMouseX, winMouseY);
}

/** Draw the controls and debug info **/
draw_set_halign(fa_right); draw_set_valign(fa_top);
var xx = winW - 10;
var yy = guiTopHeight + 15;

if (showControls) {
	draw_set_color(ui_variable_col_primary_light);
	scrDrawTextShadowed(xx, yy, "[ Controls ]");
	yy += 20;
	draw_set_color(c_white);
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
	draw_set_color(ui_variable_col_primary_light);
	scrDrawTextShadowed(xx, yy, "[ Camera Debug ]");
	yy += 20;
	draw_set_color(c_white);
	scrDrawTextShadowed(xx, yy, string("x/y/z: {0}/{1}/{2}", x, y, z));
	yy += 20;
	scrDrawTextShadowed(xx, yy, string("direction: {0}", direction));
	yy += 20;
	scrDrawTextShadowed(xx, yy, string("zdir: {0}", zdir));	
}

gpu_set_cullmode(settings.camera.culling);