// @author		Giacomo Marton
// @version		1.0.0


/**
 * Inverts the vector components
 * @param	{Array<Real>} vect		(Vec4) The vector to invert
 * @returns	{Array<Real>}			(Vec4)
 */
function vec4_invert(vect) {
	gml_pragma("forceinline");
	
	return [-vect[Vec4.x],
			-vect[Vec4.y],
			-vect[Vec4.z],
			-vect[Vec4.w] ];

}
