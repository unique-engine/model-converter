// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns whether the matrix is affine matrix
 * @param	{Array<Real>} matrix		(Mat4) The matrix to check
 * @returns	{Bool}
 */
function mat4_is_affine(matrix) {
	gml_pragma("forceinline");
	
	return  matrix[Mat4.m03] == 0.0 &&
			matrix[Mat4.m13] == 0.0 &&
			matrix[Mat4.m23] == 0.0 &&
			matrix[Mat4.m33] == 1.0 ;

}
