// @author		Giacomo Marton
// @version		1.0.0


/**
 * Creates a frustum matrix with default handedness
 * @param	{Real} left
 * @param	{Real} right
 * @param	{Real} bottom
 * @param	{Real} top
 * @param	{Real} znear		The near clipping plane
 * @param	{Real} zfar			The far clipping plane
 * @returns	{Array<Real>}		(Mat4)
 */
function mat4_frustum(left, right, bottom, top, znear, zfar) {
	gml_pragma("forceinline");
	
	if (GMM_coordinate_system == GMM_CS.left_handed)
	{
	
		if (GMM_depth_clip_space == GMM_DCS.zero_to_one)
		{
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
		else
		{
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
					(zfar + znear) / (zfar - znear),	//m22
					1.0,	//m23
					0.0,	//m30
					0.0,	//m31
					(-2.0 * zfar * znear) / (zfar - znear),	//m32
					0.0];
		}
	}
	else
	{
		if (GMM_depth_clip_space == GMM_DCS.zero_to_one)
		{
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
					zfar / (znear - zfar),	//m22
					-1.0,	//m23
					0.0,	//m30
					0.0,	//m31
					(zfar * znear) / (zfar - znear),	//m32
					0.0]; 	//m33
		}
		else
		{
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
					(zfar + znear) / (zfar - znear),	//m22
					-1.0,	//m23
					0.0,	//m30
					0.0,	//m31
					(-2.0 * zfar * znear) / (zfar - znear),	//m32
					0.0]; 	//m33
		}
	}


}
