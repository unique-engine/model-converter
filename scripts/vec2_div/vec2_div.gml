// @author		Giacomo Marton
// @version		1.0.0


/**
 * Divides a vector with another
 * @param	{Array<Real>} vect_1		(Vec2) The first vector
 * @param	{Array<Real>} vect_2		(Vec2) The second vector
 * @returns	{Array<Real>}				(Vec2)
 */
function vec2_div(vect_1, vect_2) {
	gml_pragma("forceinline");
	
	return [vect_1[Vec2.x] / vect_2[Vec2.x],
			vect_1[Vec2.y] / vect_2[Vec2.y] ];

}
