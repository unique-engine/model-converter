// @author		Giacomo Marton
// @version		1.0.0


/**
 * Creates a matrix for an orthographic parallel viewing volume, using the default handedness and clip space
 * @param	{Real} left
 * @param	{Real} right
 * @param	{Real} bottom
 * @param	{Real} top
 * @param	{Real} znear		The near clipping plane
 * @param	{Real} zfar			The far clipping plane
 * @returns	{Array<Real>}		(Mat4)
 */
function mat4_ortho(left, right, bottom, top, znear, zfar) {
	gml_pragma("forceinline");
	
	if (GMM_coordinate_system == GMM_CS.left_handed)
	{
	
		if (GMM_depth_clip_space == GMM_DCS.zero_to_one)
		{
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
					1.0 / (zfar - znear),	//m22
					0.0,	//m23
					- (right + left) / (right - left),	//m30
					- (top + bottom) / (top - bottom),	//m31
					- znear / (zfar - znear),	//m32
					1.0]; 	//m33
		}
		else
		{
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
					2.0 / (zfar - znear),	//m22
					0.0,	//m23
					- (right + left) / (right - left),	//m30
					- (top + bottom) / (top - bottom),	//m31
					- (zfar + znear) / (zfar - znear),	//m32
					1.0]; 	//m33
		}
	}
	else
	{
		if (GMM_depth_clip_space == GMM_DCS.zero_to_one)
		{
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
					- 1.0 / (zfar - znear),	//m22
					0.0,	//m23
					- (right + left) / (right - left),	//m30
					- (top + bottom) / (top - bottom),	//m31
					- znear / (zfar - znear),	//m32
					1.0]; 	//m33
		}
		else
		{
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
	}

}


/**
 * Creates a matrix for projecting two-dimensional coordinates onto the screen
 * @param	{Real} left
 * @param	{Real} right
 * @param	{Real} bottom
 * @param	{Real} top
 * @returns	{Array<Real>}		(Mat4)
 */
function mat4_ortho_2D(left, right, bottom, top) {
	gml_pragma("forceinline");
	
	var mtx;

	mtx[Mat4.m33] = 1.0;
	mtx[Mat4.m22] = 1.0;

	mtx[Mat4.m00] = 2.0 / (right - left);
	mtx[Mat4.m11] = 2.0 / (top - bottom);
	mtx[Mat4.m30] = - (right + left) / (right - left);
	mtx[Mat4.m31] = - (top + bottom) / (top - bottom);

	return mtx;

}
