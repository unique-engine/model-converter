// @author		Giacomo Marton
// @version		1.0.0


/**
 * Compares two matrices and returns if they are equal
 * @param	{Array<Real>} mtx_1		(Mat4) The first matrix to compare
 * @param	{Array<Real>} mtx_2		(Mat4) The second matrix to compare
 * @returns	{Bool}
 */
function mat4_equals(mtx_1, mtx_2) {
	gml_pragma("forceinline");
	
	return
	mtx_1[Mat4.m00] == mtx_2[Mat4.m00] &&
	mtx_1[Mat4.m01] == mtx_2[Mat4.m01] &&
	mtx_1[Mat4.m02] == mtx_2[Mat4.m02] &&
	mtx_1[Mat4.m03] == mtx_2[Mat4.m03] &&
	mtx_1[Mat4.m10] == mtx_2[Mat4.m10] &&
	mtx_1[Mat4.m11] == mtx_2[Mat4.m11] &&
	mtx_1[Mat4.m12] == mtx_2[Mat4.m12] &&
	mtx_1[Mat4.m13] == mtx_2[Mat4.m13] &&
	mtx_1[Mat4.m20] == mtx_2[Mat4.m20] &&
	mtx_1[Mat4.m21] == mtx_2[Mat4.m21] &&
	mtx_1[Mat4.m22] == mtx_2[Mat4.m22] &&
	mtx_1[Mat4.m23] == mtx_2[Mat4.m23] &&
	mtx_1[Mat4.m30] == mtx_2[Mat4.m30] &&
	mtx_1[Mat4.m31] == mtx_2[Mat4.m31] &&
	mtx_1[Mat4.m32] == mtx_2[Mat4.m32] &&
	mtx_1[Mat4.m33] == mtx_2[Mat4.m33] ;

}
