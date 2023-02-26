// @author		Giacomo Marton
// @version		1.0.0


/**
 * Calculate the length of a vector
 * @param	{Array<Real>} vect		(Vec4) Specifies the vector of which to calculate the length
 * @returns	{Real}
 */
function vec4_length(vect) {
	gml_pragma("forceinline");
	
	return sqrt(vect[Vec4.x] * vect[Vec4.x] + 
	            vect[Vec4.y] * vect[Vec4.y] + 
	            vect[Vec4.z] * vect[Vec4.z] + 
	            vect[Vec4.w] * vect[Vec4.w] );

}
