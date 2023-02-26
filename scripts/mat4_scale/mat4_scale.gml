// @author		Giacomo Marton
// @version		1.0.0


/**
 * Scales the given matrix
 * @param	{Array<Real>} matrix	(Mat4) The matrix to scale
 * @param	{Real} vx				x component of the transform vector
 * @param	{Real} vy				y component of the transform vector
 * @param	{Real} vz				z component of the transform vector
 * @returns	{Array<Real>}			(Mat4)
 */
function mat4_scale(matrix, vx, vy, vz) {
	gml_pragma("forceinline");
	
	return matrix_multiply(matrix, [vx, 0.0, 0.0, 0.0,
									0.0, vy, 0.0, 0.0,
									0.0, 0.0, vz, 0.0,
									0.0, 0.0, 0.0, 1.0]);

}
