// @author		Giacomo Marton
// @version		1.0.0


/**
 * Compares two vectors and returns if they are equal
 * @param	{Array<Real>} vect_1		(Vec4) The first vector to compare
 * @param	{Array<Real>} vect_2		(Vec4) The second vector to compare
 * @returns	{Bool}
 */
function vec4_equals(vect_1, vect_2) {
	gml_pragma("forceinline");
	
	return
	vect_1[Vec4.x] == vect_2[Vec4.x] &&
	vect_1[Vec4.y] == vect_2[Vec4.y] &&
	vect_1[Vec4.z] == vect_2[Vec4.z] &&
	vect_1[Vec4.w] == vect_2[Vec4.w] ;

}
