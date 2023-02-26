// @author		Giacomo Marton
// @version		1.0.0


/**
 * Inverts the vector components
 * @param	{Array<Real>} vect		(Vec2) The vector to invert
 * @returns	{Array<Real>}			(Vec2)
 */
function vec2_invert(vect) {
	gml_pragma("forceinline");
	
	return [-vect[Vec2.x],
			-vect[Vec2.y] ];

}
