/** @todo: untested and unused */
function mouse_xyz() {
	// Converti mouse_x e mouse_y in coordinate del mondo 3D
	var mx = (mouse_x / display_get_width()) * 2 - 1;
	var my = 1 - (mouse_y / display_get_height()) * 2;

	// Ottieni la direzione 3D usando la matrice di proiezione e la view
	var mouse3D_x = camViewMat[0] * mx + camViewMat[4] * my + camViewMat[8];
	var mouse3D_y = camViewMat[1] * mx + camViewMat[5] * my + camViewMat[9];
	var mouse3D_z = camViewMat[2] * mx + camViewMat[6] * my + camViewMat[10];

	// Normalizza il vettore direzione del mouse
	var length = point_distance_3d(0, 0, 0, mouse3D_x, mouse3D_y, mouse3D_z);
	mouse3D_x /= length;
	mouse3D_y /= length;
	mouse3D_z /= length;

	// Calcola il punto di intersezione con il piano z=0
	var t = -z / mouse3D_z;
	
	return [
		x + mouse3D_x * t,
		y + mouse3D_y * t,
		0
	];
}