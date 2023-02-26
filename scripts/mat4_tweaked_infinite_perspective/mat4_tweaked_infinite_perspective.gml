// @author		Giacomo Marton
// @version		1.0.0


/**
 * Creates a matrix for a symmetric perspective-view frustum with far plane at infinite for graphics hardware that doesn't support depth clamping
 * @param	{Real} fovy		Specifies the field of view angle in the y direction. Expressed in radians
 * @param	{Real} aspect	Aspect ratio between horizontal and vertical size of the view
 * @param	{Real} near		The near clipping plane
 * @returns	{Array<Real>}	(Mat4)
 */
function mat4_tweaked_infinite_perspective(fovy, aspect, near) {
	gml_pragma("forceinline");
	
	var t = tan(fovy * 0.5);
	
	return [1.0 / (t * aspect),	//m00
			0.0,	//m01
			0.0,	//m02
			0.0,	//m03
			0.0,	//m10
			1.0 / t,	//m11
			0.0,	//m12
			0.0,	//m13
			0.0,	//m20
			0.0,	//m21
			GMM_epsilon - 1.0,	//m22
			-1.0,	//m23
			0.0,	//m30
			0.0,	//m31
			GMM_epsilon - 2.0 * near,	//m32
			0.0]; 	//m33

}
