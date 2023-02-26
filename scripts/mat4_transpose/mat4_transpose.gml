// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the transpose of the given matrix
 * @param	{Array<Real>} matrix	(Mat4) The matrix to transpose
 * @returns	{Array<Real>}			(Mat4)
 */
function mat4_transpose(matrix) {
	gml_pragma("forceinline");
	
	return [matrix[Mat4.m00],
			matrix[Mat4.m10],
			matrix[Mat4.m20],
			matrix[Mat4.m30],
			matrix[Mat4.m01],
			matrix[Mat4.m11],
			matrix[Mat4.m21],
			matrix[Mat4.m31],
			matrix[Mat4.m02],
			matrix[Mat4.m12],
			matrix[Mat4.m22],
			matrix[Mat4.m32],
			matrix[Mat4.m03],
			matrix[Mat4.m13],
			matrix[Mat4.m23],
			matrix[Mat4.m33] ];

}
