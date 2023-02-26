// @author		Giacomo Marton
// @version		1.0.0


/**
 * Multiply a matrix with a scalar value
 * @param	{Array<Real>} matrix		(Mat4) The matrix to multiply
 * @param	{Real} val					The scalar value
 * @returns	{Array<Real>}				(Mat4)
 */
function mat4_mul_scalar(matrix, val) {
	gml_pragma("forceinline");
	
	return [matrix[Mat4.m00] * val,
			matrix[Mat4.m01] * val,
			matrix[Mat4.m02] * val,
			matrix[Mat4.m03] * val,
			matrix[Mat4.m10] * val,
			matrix[Mat4.m11] * val,
			matrix[Mat4.m12] * val,
			matrix[Mat4.m13] * val,
			matrix[Mat4.m20] * val,
			matrix[Mat4.m21] * val,
			matrix[Mat4.m22] * val,
			matrix[Mat4.m23] * val,
			matrix[Mat4.m30] * val,
			matrix[Mat4.m31] * val,
			matrix[Mat4.m32] * val,
			matrix[Mat4.m33] * val ];

}
