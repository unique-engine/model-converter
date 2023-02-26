// @author		Giacomo Marton
// @version		1.0.0


/**
 * Creates a matrix for an orthographic parallel viewing volume, using right-handedness, clip space "-1 to 1"
 * @param	{Real} left
 * @param	{Real} right
 * @param	{Real} bottom
 * @param	{Real} top
 * @param	{Real} znear		The near clipping plane
 * @param	{Real} zfar			The far clipping plane
 * @returns	{Array<Real>}		(Mat4)
 */
function mat4_ortho_RH_MO(left, right, bottom, top, znear, zfar) {
	gml_pragma("forceinline");
	
	return [2.0 / (right - left),	//m00
			0.0,	//m01
			0.0,	//m02
			0.0,	//m03
			0.0,	//m10
			2.0 / (top - bottom),	//m11
			0.0,	//m12
			0.0,	//m13
			0.0,	//m20
			0.0,	//m21
			- 2.0 / (zfar - znear),	//m22
			0.0,	//m23
			- (right + left) / (right - left),	//m30
			- (top + bottom) / (top - bottom),	//m31
			- (zfar + znear) / (zfar - znear),	//m32
			1.0]; 	//m33

}
