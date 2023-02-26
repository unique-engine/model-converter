// @author		Giacomo Marton
// @version		1.0.0


/**
 * Builds a perspective projection matrix based on a field of view, right handedness, clip space "0 to 1"
 * @param	{Real} fov		Specifies the field of view angle. Expressed in radians
 * @param	{Real} width	The width of the view
 * @param	{Real} height	The height of the view
 * @param	{Real} near		The near clipping plane
 * @param	{Real} far		The far clipping plane
 * @returns	{Array<Real>}	(Mat4)
 */
function mat4_perspective_fov_RH_ZO(fov, width, height, near, far) {
	gml_pragma("forceinline");
	
	var h = 1.0 / tan(fov * 0.5);
	var w = h * height / width;
	
	return [w,		//m00
			0.0,	//m01
			0.0,	//m02
			0.0,	//m03
			0.0,	//m10
			h,		//m11
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

