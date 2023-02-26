// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the distance between the given vectors
 * @param	{Array<Real>} vect_1		(Vec2) The first vector
 * @param	{Array<Real>} vect_2		(Vec2) The second vector
 * @returns	{Real}
 */
function vec2_distance(vect_1, vect_2) {
	gml_pragma("forceinline");
	
	var vec0 = vect_1[Vec2.x] - vect_2[Vec2.x];
	var vec1 = vect_1[Vec2.y] - vect_2[Vec2.y];

	return sqrt(vec0 * vec0 +
	            vec1 * vec1 );

}
