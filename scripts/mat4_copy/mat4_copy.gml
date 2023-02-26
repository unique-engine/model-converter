// @author		Giacomo Marton
// @version		1.0.0


/**
 * Copy the data from one matrix to another
 * @param	{Array<Real>} matrix		(Mat4) The matrix on which to copy the components
 * @param	{Array<Real>} source		(Mat4) The source matrix from which to copy the components
 */
function mat4_copy(matrix, source) {
	gml_pragma("forceinline");
	
	matrix[Mat4.m33] = source[Mat4.m33];
	matrix[Mat4.m32] = source[Mat4.m32];
	matrix[Mat4.m31] = source[Mat4.m31];
	matrix[Mat4.m30] = source[Mat4.m30];
	matrix[Mat4.m23] = source[Mat4.m23];
	matrix[Mat4.m22] = source[Mat4.m22];
	matrix[Mat4.m21] = source[Mat4.m21];
	matrix[Mat4.m20] = source[Mat4.m20];
	matrix[Mat4.m13] = source[Mat4.m13];
	matrix[Mat4.m12] = source[Mat4.m12];
	matrix[Mat4.m11] = source[Mat4.m11];
	matrix[Mat4.m10] = source[Mat4.m10];
	matrix[Mat4.m03] = source[Mat4.m03];
	matrix[Mat4.m02] = source[Mat4.m02];
	matrix[Mat4.m01] = source[Mat4.m01];
	matrix[Mat4.m00] = source[Mat4.m00];

}
