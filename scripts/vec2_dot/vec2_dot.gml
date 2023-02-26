// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the dot product of <vect_1> and <vect_2>
 * @param	{Array<Real>} vect_1		(Vec2) The first vector
 * @param	{Array<Real>} vect_2		(Vec2) The second vector
 * @returns	{Real}
 */
function vec2_dot(vect_1, vect_2) {
	gml_pragma("forceinline");
	
	return	vect_1[Vec2.x] * vect_2[Vec2.x] +
			vect_1[Vec2.y] * vect_2[Vec2.y];

}
