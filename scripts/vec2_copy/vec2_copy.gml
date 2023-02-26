// @author		Giacomo Marton
// @version		1.0.0


/**
 * Copy the data from one vector to another
 * @param	{Array<Real>} vect		(Vec2) The vector on which to copy the components
 * @param	{Array<Real>} source	(Vec2) The source vector from which to copy the components
 */
function vec2_copy(vect, source) {
	gml_pragma("forceinline");
	
	vect[Vec2.x] = source[Vec2.x];
	vect[Vec2.y] = source[Vec2.y];

}
