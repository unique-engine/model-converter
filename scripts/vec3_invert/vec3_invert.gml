// @author		Giacomo Marton
// @version		1.0.0


/**
 * Inverts the vector components
 * @param	{Array<Real>} vect		(Vec3) The vector to invert
 * @returns	{Array<Real>}			(Vec3)
 */
function vec3_invert(vect) {
	gml_pragma("forceinline");
	
	return [-vect[Vec3.x],
			-vect[Vec3.y],
			-vect[Vec3.z] ];

}
