// @author		Giacomo Marton
// @version		1.0.0


/**
 * Multiply a vector with another
 * @param	{Array<Real>} vect_1		(Vec2) The first vector
 * @param	{Array<Real>} vect_2		(Vec2) The second vector
 * @returns	{Array<Real>}				(Vec2)
 */
function vec2_mul(vect_1, vect_2) {
	gml_pragma("forceinline");
	
	return [vect_1[Vec2.x] * vect_2[Vec2.x],
			vect_1[Vec2.y] * vect_2[Vec2.y] ];

}


/**
 * Multiply a vector with a scalar value
 * @param	{Array<Real>} vect		(Vec2) The vector to multiply
 * @param	{Real} val				The scalar value
 * @returns	{Array<Real>}			(Vec2)
 */
function vec2_mul_scalar(vect, val) {
	gml_pragma("forceinline");
	
	return [vect[Vec2.x] * val,
			vect[Vec2.y] * val ];

}
