// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns a perspective projection matrix with the given parameters, default handedness, default clip space
 * @param	{Real} fovy		Specifies the field of view angle in the y direction. Expressed in radians
 * @param	{Real} aspect	Aspect ratio between horizontal and vertical size of the view
 * @param	{Real} near		The near clipping plane
 * @param	{Real} far		The far clipping plane
 * @returns	{Array<Real>}	(Mat4)
 */
function mat4_perspective(fovy, aspect, near, far) {
	gml_pragma("forceinline");
	
	var fov_d = 1.0 / tan(fovy * 0.5);
	
	if (GMM_coordinate_system == GMM_CS.left_handed)
	{
	
		if (GMM_depth_clip_space == GMM_DCS.zero_to_one)
		{
			return [fov_d / aspect,	//m00
					0.0,	//m01
					0.0,	//m02
					0.0,	//m03
					0.0,	//m10
					fov_d,	//m11
					0.0,	//m12
					0.0,	//m13
					0.0,	//m20
					0.0,	//m21
					far / (far - near),	//m22
					1.0,	//m23
					0.0,	//m30
					0.0,	//m31
					- (far * near) / (far - near),	//m32
					0.0]; 	//m33
		}
		else
		{
			return [fov_d / aspect,	//m00
					0.0,	//m01
					0.0,	//m02
					0.0,	//m03
					0.0,	//m10
					fov_d,	//m11
					0.0,	//m12
					0.0,	//m13
					0.0,	//m20
					0.0,	//m21
					(far + near) / (far - near),	//m22
					1.0,	//m23
					0.0,	//m30
					0.0,	//m31
					(-2.0 * far * near) / (far - near),	//m32
					0.0]; 	//m33
		}
	}
	else
	{
		if (GMM_depth_clip_space == GMM_DCS.zero_to_one)
		{
			return [fov_d / aspect,	//m00
					0.0,	//m01
					0.0,	//m02
					0.0,	//m03
					0.0,	//m10
					fov_d,	//m11
					0.0,	//m12
					0.0,	//m13
					0.0,	//m20
					0.0,	//m21
					far / (near - far),	//m22
					-1.0,	//m23
					0.0,	//m30
					0.0,	//m31
					- (far * near) / (far - near),	//m32
					0.0]; 	//m33
		}
		else
		{
			return [fov_d / aspect,	//m00
					0.0,	//m01
					0.0,	//m02
					0.0,	//m03
					0.0,	//m10
					fov_d,	//m11
					0.0,	//m12
					0.0,	//m13
					0.0,	//m20
					0.0,	//m21
					- (far + near) / (far - near),	//m22
					-1.0,	//m23
					0.0,	//m30
					0.0,	//m31
					(-2.0 * far * near) / (far - near),	//m32
					0.0]; 	//m33
		}
	}

}
