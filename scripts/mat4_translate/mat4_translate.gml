// @author		Giacomo Marton
// @version		1.0.0


/**
 * Translates the given matrix
 * @param	{Array<Real>} matrix		(Mat4) The matrix to translate
 * @param	{Real} vx					x component of the transform vector
 * @param	{Real} vy					y component of the transform vector
 * @param	{Real} vz					z component of the transform vector
 * @returns	{Array<Real>}				(Mat4)
 */
function mat4_translate(matrix, vx, vy, vz) {
	gml_pragma("forceinline");
	
	return matrix_multiply(matrix, [1.0, 0.0, 0.0, 0.0,
									0.0, 1.0, 0.0, 0.0,
									0.0, 0.0, 1.0, 0.0,
									vx, vy, vz, 1.0]);

}
