// @author		Giacomo Marton
// @version		1.0.0


/**
 * Calculate the length of a vector
 * @param	{Array<Real>} vect		(Vec2) Specifies the vector of which to calculate the length
 * @returns	{Real}
 */
function vec2_length(vect) {
	gml_pragma("forceinline");
	
	return sqrt(vect[Vec2.x] * vect[Vec2.x] + 
	            vect[Vec2.y] * vect[Vec2.y] );

}
