// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns a rotation matrix of a particular axis with the given angle (in degrees)
 * @param	{Real} vx		x component of the transform vector
 * @param	{Real} vy		y component of the transform vector
 * @param	{Real} vz		z component of the transform vector
 * @param	{Real} angle	The angle of rotation
 * @returns	{Array<Real>}	(Mat4)
 */
function mat4_set_rotation_axis(vx, vy, vz, angle) {
	gml_pragma("forceinline");
	
	var COS = dcos(-angle);
	var ICOS = 1.0 - COS;
	var SIN = dsin(-angle);
	var L = vx;
	var M = vy;
	var N = vz;
	var sum = L * L + M * M + N * N;
	if (sum != 0.0)
	{
	    var factor = 1.0 / sqrt(sum);
	    L *= factor;
	    M *= factor;
	    N *= factor;
	}

	return [L * L * ICOS + COS,
			L * M * ICOS + N * SIN,
			L * N * ICOS - M * SIN,
			0.0,
			M * L * ICOS - N * SIN,
			M * M * ICOS + COS,
			M * N * ICOS + L * SIN,
			0.0,
			N * L * ICOS + M * SIN,
			N * M * ICOS - L * SIN,
			N * N * ICOS + COS,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0];

}


/**
 * Returns a rotation matrix with the given angle around the X axis (in degrees)
 * @param	{Real} angle	The angle of rotation
 * @returns	{Array<Real>}	(Mat4)
 */
function mat4_set_rotation_x(angle) {
	gml_pragma("forceinline");
	
	var COS = dcos(-angle);
	var SIN = dsin(-angle);
	
	return [1.0, 0.0, 0.0, 0.0,
			0.0, COS, SIN, 0.0,
			0.0, -SIN, COS, 0.0,
			0.0, 0.0, 0.0, 1.0];

}


/**
 * Returns a rotation matrix with the given angle around the Y axis (in degrees)
 * @param	{Real} angle	The angle of rotation
 * @returns	{Array<Real>}	(Mat4)
 */
function mat4_set_rotation_y(angle) {
	gml_pragma("forceinline");
	
	var COS = dcos(-angle);
	var SIN = dsin(-angle);

	return [COS, 0.0, -SIN, 0.0,
			0.0, 1.0, 0.0, 0.0,
			SIN, 0.0, COS, 0.0,
			0.0, 0.0, 0.0, 1.0];

}


/**
 * Returns a rotation matrix with the given angle around the Z axis (in degrees)
 * @param	{Real} angle	The angle of rotation
 * @returns	{Array<Real>}	(Mat4)
 */
function mat4_set_rotation_z(angle) {
	gml_pragma("forceinline");
	
	var COS = dcos(-angle);
	var SIN = dsin(-angle);

	return [COS, SIN, 0.0, 0.0,
			-SIN, COS, 0.0, 0.0,
			0.0, 0.0, 1.0, 0.0,
			0.0, 0.0, 0.0, 1.0];

}
