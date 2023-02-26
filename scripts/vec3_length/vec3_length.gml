// @author		Giacomo Marton
// @version		1.0.0


/**
 * Calculate the length of a vector
 * @param	{Array<Real>} vect		(Vec3) Specifies the vector of which to calculate the length
 * @returns	{Real}
 */
function vec3_length(vect) {
	gml_pragma("forceinline");
	
	return sqrt(vect[Vec3.x] * vect[Vec3.x] + 
	            vect[Vec3.y] * vect[Vec3.y] + 
	            vect[Vec3.z] * vect[Vec3.z] );

}
