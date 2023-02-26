// @author		Giacomo Marton
// @version		1.0.0


/**
 * Build a look at view matrix using left handedness
 * @param	{Array<Real>} eye		(Vec3)
 * @param	{Array<Real>} center	(Vec3)
 * @param	{Array<Real>} up		(Vec3)
 * @returns	{Array<Real>}			(Mat4)
 */
function mat4_lookat_LH(eye, center, up) {
	gml_pragma("forceinline");
	
	var eye_x = eye[Vec3.x];
	var eye_y = eye[Vec3.y];
	var eye_z = eye[Vec3.z];
	var factor;

	var fx = center[Vec3.x] - eye_x;
	var fy = center[Vec3.y] - eye_y;
	var fz = center[Vec3.z] - eye_z;
	factor = sqrt(fx * fx + fy * fy + fz * fz);
	fx /= factor;
	fy /= factor;
	fz /= factor;

	var sx = up[Vec3.y] * fz - up[Vec3.z] * fy;
	var sy = up[Vec3.z] * fx - up[Vec3.x] * fz;
	var sz = up[Vec3.x] * fy - up[Vec3.y] * fx;
	factor = sqrt(sx * sx + sy * sy + sz * sz);
	sx /= factor;
	sy /= factor;
	sz /= factor;

	var ux = fy * sz - fz * sy;
	var uy = fz * sx - fx * sz;
	var uz = fx * sy - fy * sx;

	return [sx, ux, fx, 0.0,
			sy, uy, fy, 0.0,
			sz, uz, fz, 0.0,
			
			- ( sx * eye_x +
				sy * eye_y +
				sz * eye_z ),
			- ( ux * eye_x +
				uy * eye_y +
				uz * eye_z ),
			- ( fx * eye_x +
				fy * eye_y +
				fz * eye_z ),
			1.0];

}
