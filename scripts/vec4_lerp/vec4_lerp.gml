// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the linear interpolation of two input vectors by the given amount
 * @param	{Array<Real>} vect_1		(Vec4) The first vector
 * @param	{Array<Real>} vect_2		(Vec4) The second vector
 * @param	{Real} amount				The amount to interpolate
 * @returns	{Array<Real>}				(Vec4)
 */
function vec4_lerp(vect_1, vect_2, amount) {
	gml_pragma("forceinline");
	
	return [vect_1[Vec4.x] + amount * (vect_2[Vec4.x] - vect_1[Vec4.x]),
			vect_1[Vec4.y] + amount * (vect_2[Vec4.y] - vect_1[Vec4.y]),
			vect_1[Vec4.z] + amount * (vect_2[Vec4.z] - vect_1[Vec4.z]),
			vect_1[Vec4.w] + amount * (vect_2[Vec4.w] - vect_1[Vec4.w]) ];

}
