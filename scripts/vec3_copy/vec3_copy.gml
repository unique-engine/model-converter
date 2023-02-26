// @author		Giacomo Marton
// @version		1.0.0


/**
 * Copy the data from one vector to another
 * @param	{Array<Real>} vect		(Vec3) The vector on which to copy the components
 * @param	{Array<Real>} source	(Vec3) The source vector from which to copy the components
 */
function vec3_copy(vect, source) {
	gml_pragma("forceinline");
	
	vect[Vec3.x] = source[Vec3.x];
	vect[Vec3.y] = source[Vec3.y];
	vect[Vec3.z] = source[Vec3.z];

}
