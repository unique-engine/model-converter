// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the linear interpolation of two input vectors by the given amount
 * @param	{Array<Real>} vect_1		(Vec2) The first vector
 * @param	{Array<Real>} vect_2		(Vec2) The second vector
 * @param	{Real} amount				The amount to interpolate
 * @returns	{Array<Real>}				(Vec2)
 */
function vec2_lerp(vect_1, vect_2, amount) {
	gml_pragma("forceinline");
	
	return [vect_1[Vec2.x] + amount * (vect_2[Vec2.x] - vect_1[Vec2.x]),
			vect_1[Vec2.y] + amount * (vect_2[Vec2.y] - vect_1[Vec2.y]) ];

}
