// @author		Giacomo Marton
// @version		1.0.0


/**
 * Creates a frustum matrix with left handedness, clip space "0 to 1"
 * @param	{Real} left
 * @param	{Real} right
 * @param	{Real} bottom
 * @param	{Real} top
 * @param	{Real} znear		The near clipping plane
 * @param	{Real} zfar			The far clipping plane
 * @returns	{Array<Real>}		(Mat4)
 */
function mat4_frustum_LH_ZO(left, right, bottom, top, znear, zfar) {
	gml_pragma("forceinline");
	
	return [2.0 * znear * ( right - left),	//m00
			0.0,	//m01
			0.0,	//m02
			0.0,	//m03
			0.0,	//m10
			2.0 * znear * ( top - bottom),	//m11
			0.0,	//m12
			0.0,	//m13
			(right + left) / (right - left),	//m20
			(top + bottom) / (top - bottom),	//m21
			1.0 / (zfar - znear),	//m22
			1.0,	//m23
			0.0,	//m30
			0.0,	//m31
			- (zfar * znear) / (zfar - znear),	//m32
			0.0]; 	//m33

}
