// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns a translation matrix with the given values
 * @param	{Real} vx		x component of the transform vector
 * @param	{Real} vy		y component of the transform vector
 * @param	{Real} vz		z component of the transform vector
 * @returns	{Array<Real>}	(Mat4)
 */
function mat4_set_translation(vx, vy, vz) {
	gml_pragma("forceinline");
	
	return [1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0,
			0.0,
			vx,
			vy,
			vz,
			1.0];

}
